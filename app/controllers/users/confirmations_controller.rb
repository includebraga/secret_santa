class Users::ConfirmationsController < ApplicationController
  def create
    user_confirmation_flow = UserConfirmationFlow.new(params[:token])
    user_confirmation_flow.perform

    if user_confirmation_flow.successful?
      @user = user_confirmation_flow.user
      @receiver = user_confirmation_flow.receiver
    elsif user_confirmation_flow.user_deleted?
      render "closed"
    else
      not_found
    end
  end
end
