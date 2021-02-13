# frozen_string_literal: true

class HabitComponent < ViewComponent::Base
  include Turbo::FramesHelper
  extend Dry::Initializer

  option :habit, Types.Instance(Habit)
  option :date,
         Types::ChoresDate,
         default: proc { Date.today },
         optional: true

  def goal_reached?
    progress >= habit.goal
  end

  def out_of_text
    "/ #{ habit.goal } a #{ habit.time_period }"
  end

  def log_to_delete
    logs_by_date.order(:logged_at).last
  end

  def progress
    @progress ||= logs_by_date.count
  end

  private

  def logs_by_date
    @logs_by_date ||=
      begin
        start_date = date.send("beginning_of_#{ habit.time_period }")
        end_date = date.end_of_day

        habit.logs.where(logged_for: start_date..end_date)
      end
  end
end
