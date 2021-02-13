# frozen_string_literal: true

module Habits
  class LogsController < ApplicationController
    def create
      @log = habit.logs.new(**habit_log_params, logged_at: Time.current)

      respond_to do |format|
        if @log.save
          format.turbo_stream
        else
          format.turbo_stream
        end
      end
    end

    def destroy
      respond_to do |format|
        if log.destroy
          format.turbo_stream
        else
        end
      end
    end

    private

    def habit_log_params
      params.permit(:logged_for)
    end

    def log
      @log ||= habit.logs.find(params[:id])
    end

    def habit
      @habit ||= current_profile.habits.find(params[:habit_id])
    end
  end
end
