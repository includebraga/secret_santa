module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin, :log_access

    def records_per_page
      params[:per_page] || 50
    end

    protected

    def authenticate_admin
      basic_auth unless Rails.env.development?
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        ENV["BASIC_AUTH"].split(":") == [username, password]
      end
    end

    def log_access
      Rails.logger.info("Admin dashboard accessed from #{request.remote_ip}") unless Rails.env.development?
    end
  end
end
