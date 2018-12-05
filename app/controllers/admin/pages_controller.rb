module Admin
  class PagesController < Admin::ApplicationController
    def index
      analytics = Analytics.build

      @gifts_received = analytics.gifts_received
      @gifts_received_late = analytics.gifts_received_late
      @gifts_missing = analytics.gifts_missing
      @gifts_missing_before_rematch = analytics.gifts_missing_before_rematch
      @gifts_matched = analytics.gifts_matched
      @normal_receivers = analytics.normal_receivers
      @golden_receivers = analytics.golden_receivers
      @total_receivers = analytics.total_receivers
      @unconfirmed_users = analytics.unconfirmed_users
      @confirmed_users = analytics.confirmed_users
      @total_users = analytics.total_users
    end
  end
end
