class HomeController < ApplicationController
  def index
    @user = user_from_session
  end

  private

  def user_from_session
    if user_params
      User.new(user_params).with_validations
    else
      User.new
    end
  end

  def user_params
    @_user_params ||= session.delete(:user)
  end
end
