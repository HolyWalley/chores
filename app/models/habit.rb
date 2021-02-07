# frozen_string_literal: true

class Habit < ApplicationRecord
  class Reminder
    include StoreModel::Model

    attribute :remind_at, :time
    attribute :id, :integer

    validates :remind_at, presence: true
  end

  class Repeat
    include StoreModel::Model

    enum :period, %i[weekdays days weeks months years], default: :weekdays
    attribute :each, :integer, default: 1
    attribute :weekdays, :string, default: "MonTueWedThuFriSatSun"

    validates :period, presence: true
    validates :each, presence: true, if: -> { period.to_sym != :weekdays }
    validates :weekdays, presence: true, if: -> { period.to_sym == :weekdays }
  end

  attribute :reminders, Reminder.to_array_type
  attribute :repeat, Repeat.to_type

  belongs_to :category

  enum time_period: %i[day week month]

  scope :by_category_id, ->(category_id) { category_id.present? ? where(category_id: category_id) : all }
  scope :by_date, ->(date) {
    return all if date.blank?

    date = Date.parse(date)

    base = where("start_date <= ?", date)

    base.where("repeat ->> 'period' = ?", Repeat.new.period_values[:weekdays].to_s)
        .where("repeat ->> 'weekdays' ILIKE ?", "%#{ date.strftime("%a") }%").or(
          base.where("repeat ->> 'period' = ?", Repeat.new.period_values[:days].to_s)
              .where("EXTRACT(days from (?::timestamp - start_date))::integer % (repeat ->> 'each')::integer = 0", date)
    ).or(
      base.where("repeat ->> 'period' = ?", Repeat.new.period_values[:weeks].to_s)
      .where("EXTRACT(days from (?::timestamp - start_date))::integer / 7.0 % (repeat ->> 'each')::integer = 0", date)
    )
  }

  validates :reminders, :repeat, store_model: true

  validates :category_id, :name, :goal, :time_period, :start_date, :reminders, presence: true

  def self.build_reminder
    Reminder.new(remind_at: '04:20')
  end

  def self.build_repeat
    Repeat.new
  end

  def build_reminder
    self.class.build_reminder
  end

  def build_repeat
    self.class.build_repeat
  end
end
