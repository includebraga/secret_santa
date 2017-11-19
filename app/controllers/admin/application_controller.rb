module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def records_per_page
      params[:per_page] || 50
    end

    protected

    def authenticate_admin
      authenticate_or_request_with_http_basic do |username, password|
        ENV["BASIC_AUTH"].split(":") == [username, password]
      end
    end

  end
end
