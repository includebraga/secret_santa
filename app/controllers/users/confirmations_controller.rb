class Users::ConfirmationsController < ApplicationController
  def create
    user_confirmation = UserConfirmation.new(params[:token])
    user_confirmation.perform

    if user_confirmation.successful?
      @user = user_confirmation.user
    else
      not_found
    end
  end
end
