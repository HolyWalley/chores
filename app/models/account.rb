# frozen_string_literal: true

require 'bcrypt'

class Account < ApplicationRecord
  include BCrypt

  has_secure_password

  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :profile

  validates :email, presence: true
end
