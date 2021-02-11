# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :account

  has_many :habits

  validates :username, presence: true
end
