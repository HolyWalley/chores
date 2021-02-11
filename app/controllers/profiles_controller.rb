# frozen_string_literal: true

class ProfilesController < ApplicationController
  def show
  end

  def update
    if current_profile.update(profile_params)
      redirect_to :root
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:username, account_attributes: %i[email password password_confirmation])
  end
end
