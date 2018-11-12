class UsersController < ApplicationController
  protect_from_forgery except: :create

  def create
    user_creation = UserCreation.new(user_params)
    user_creation.perform

    if user_creation.successful?
      @user = user_creation.user

      render "create"
    else
      render "error"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end

  def user_from_session
    if user_session_params
      User.new(user_session_params).with_validations
    else
      User.new
    end
  end
end
