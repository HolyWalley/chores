# frozen_string_literal: true

module Habits
  class LogsController < ApplicationController
    def create
      @log = habit.logs.new

      respond_to do |format|
        if @log.save
          format.turbo_stream
        else
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

    def log
      @log ||= habit.logs.find(params[:id])
    end

    def habit
      @habit ||= current_profile.habits.find(params[:habit_id])
    end
  end
end
