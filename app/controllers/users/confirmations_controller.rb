class Users::ConfirmationsController < ApplicationController
  def create
    user_confirmation = UserConfirmation.new(params[:token])
    user_confirmation.perform

    if user_confirmation.successful?
      @user = user_confirmation.user
      @receiver = match_assignment_receiver

      not_found unless @receiver
    else
      not_found
    end
  end

  private

  def match_assignment_receiver
    match_assignment = MatchAssignment.new(@user)
    match_assignment.perform

    match_assignment.successful? ? match_assignment.receiver : nil
  end
end
