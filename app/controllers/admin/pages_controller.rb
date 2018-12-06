module Admin
  class PagesController < Admin::ApplicationController
    def index
      @analytics = Analytics.build
    end
  end
end
