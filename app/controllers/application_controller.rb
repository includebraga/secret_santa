class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_raven_context

  def not_found
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end

  private

  def set_raven_context
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
