module Admin
  class PagesController < Admin::ApplicationController
    def index
      analytics = Analytics.build

      @gifts_received = analytics.gifts_received
      @gifts_missing = analytics.gifts_missing
      @gifts_matched = analytics.gifts_matched
      @normal_receivers = analytics.normal_receivers
      @golden_receivers = analytics.golden_receivers
      @total_receivers = analytics.total_receivers
    end
  end
end
