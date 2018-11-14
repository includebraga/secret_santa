class HomeController < ApplicationController
  def index
    @registrations_enabled = Settings.registrations_enabled?
  end
end
