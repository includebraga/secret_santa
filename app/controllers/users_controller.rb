class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Thank you for signing up!"
      render "confirmed"
    else
      assign_session_variables(@user)
      redirect_to root_path
    end
  end

  private

  def assign_session_variables(user)
    flash[:error] = "Uh-oh, something went wrong..."
    session[:user] = user.attributes
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
