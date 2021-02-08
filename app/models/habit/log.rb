# frozen_string_literal: true

class Habit::Log < ApplicationRecord
  belongs_to :habit
end
