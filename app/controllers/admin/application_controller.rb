module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin
    before_action :set_default_locale

    def records_per_page
      params[:per_page] || 50
    end

    protected

    def authenticate_admin
      redirect_to new_session_path unless current_user
    end

    def set_default_locale
      I18n.default_locale = :en
    end

    def current_user
      return unless session[:uuid]

      Organizer.find_by(uuid: session[:uuid])
    end
  end
end
