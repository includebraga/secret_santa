class UsersController < ApplicationController
  def create
    user_creation = UserCreation.new(user_params)
    user_creation.perform

    if user_creation.successful?
      assign_success_variables(user_creation.user)
    else
      assign_failure_variables(user_params)
      redirect_to root_path
    end
  end

  private

  def assign_failure_variables(user_params)
    flash[:error] = "Uh-oh, something went wrong..."
    session[:user] = user_params
  end

  def assign_success_variables(user)
    flash[:notice] = "Thank you for signing up!"
    @user = user
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
