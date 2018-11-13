class UsersController < ApplicationController
  protect_from_forgery except: :create

  def create
    user_creation = UserCreation.new(user_params)
    user_creation.perform

    if user_creation.successful?
      @user = user_creation.user

      render "create"
    elsif user_creation.user_exists?
      render "email_in_use"
    else
      render "error"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
