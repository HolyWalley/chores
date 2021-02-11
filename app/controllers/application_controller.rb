# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize

  helper_method :current_profile, :current_account

  def current_account
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end

  def current_profile
    @current_profile ||= current_account.profile
  end

  private

  def authorize
    redirect_to :signin unless current_account
  end
end
