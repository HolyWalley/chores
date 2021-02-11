# frozen_string_literal: true

class AccountsController < ApplicationController
  layout 'auth'

  skip_before_action :authorize

  def new
    @account = Account.new
    @account.build_profile
  end

  def create
    @account = Account.new(account_params)

    if @account.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password, profile_attributes: :username)
  end
end
