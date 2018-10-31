module Admin
  class PagesController < Admin::ApplicationController
    def index
      @gifts_received = gifts_received
      @gifts_matched = gifts_matched
      @gifts_missing = @gifts_matched - @gifts_received
      @normal_receivers = normal_receivers
      @golden_receivers = golden_receivers
      @total_receivers = @normal_receivers + @golden_receivers
    end

    private

    def gifts_received
      Match.where(received: true).count
    end

    def gifts_matched
      Match.count
    end

    def normal_receivers
      Receiver.where(golden: false).count
    end

    def golden_receivers
      Receiver.where(golden: true).count
    end
  end
end
