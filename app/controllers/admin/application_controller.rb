module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin
    before_action :set_default_locale

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

    def set_default_locale
      I18n.default_locale = :en
    end
  end
end
