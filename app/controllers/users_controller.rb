class UsersController < ApplicationController
  def new
    if User.limit_reached?
      render "closed"
    else
      @user = user_from_session
      render "new"
    end
  end

  def create
    user_creation = UserCreation.new(user_params)
    user_creation.perform

    if user_creation.successful?
      assign_success_variables(user_creation.user)
      render "create"
    else
      assign_failure_variables(user_params)
      redirect_to new_user_path
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

  def user_from_session
    if user_session_params
      User.new(user_session_params).with_validations
    else
      User.new
    end
  end

  def user_session_params
    @_user_params ||= session.delete(:user)
  end
end
