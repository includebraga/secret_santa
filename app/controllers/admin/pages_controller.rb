module Admin
  class PagesController < Admin::ApplicationController
    def index
      @remaining_receivers = remaining_receivers.count
      @exceeding_receivers = exceeding_receivers.count
      @users_without_redeem = users_without_redeem.count
      @gifts_received = gifts_received
      @gifts_matched = gifts_matched
      @total_receivers = total_receivers
    end

    private

    def remaining_receivers
      Receiver.where(golden: false, matched_gifts: 1)
    end

    def exceeding_receivers
      Receiver.where(golden: false, matched_gifts: 3)
    end

    def gifts_received
      Receiver.sum(:received_gifts)
    end

    def gifts_matched
      Receiver.sum(:matched_gifts)
    end

    def total_receivers
      (normal_receiver_total * 2) + golden_receiver_total
    end

    def normal_receiver_total
      Receiver.where(golden: false).count
    end

    def golden_receiver_total
      Receiver.where(golden: true).count
    end

    def users_without_redeem
      User.where.not(redeem_token: nil).select { |u| u.matches.empty? }
    end
  end
end
