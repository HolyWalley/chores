# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :account

  has_many :habits

  accepts_nested_attributes_for :account

  validates :username, presence: true
end
