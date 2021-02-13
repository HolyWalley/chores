# frozen_string_literal: true

class ToastComponent < ViewComponent::Base
  include Turbo::FramesHelper
  extend Dry::Initializer

  TYPES_CLASS_MAP = {
    error:   "text-white bg-danger",
    warning: "text-white bg-warning",
    success: "text-white bg-success",
    info:    "text-white bg-info"
  }.freeze

  option :error_message
  option :type, Types::Coercible::Symbol.enum(:error, :warning, :success, :info)

  def toast_class
    "toast align-items-center border-0 #{ TYPES_CLASS_MAP[type] }"
  end
end
