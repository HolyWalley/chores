# frozen_string_literal: true

class Habit::Log < ApplicationRecord
  belongs_to :habit

  validates :logged_for, :logged_at, presence: true
  validates :logged_for, date: { before_or_equal_to: proc { Date.today } }
end
