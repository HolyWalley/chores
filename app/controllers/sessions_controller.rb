# frozen_string_literal: true

class SessionsController < ApplicationController
  layout 'auth'

  skip_before_action :authorize, only: %i[create new]

  def create
    account = Account.find_by_email(session_params[:email])

    if account && account.authenticate(session_params[:password])
      session[:account_id] = account.id
      redirect_to :root
    else
      redirect_to :signin
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to :signin
  end

  private

  def session_params
    params.fetch(:session)
  end
end
