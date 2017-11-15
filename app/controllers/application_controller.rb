class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def not_found
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end
end
