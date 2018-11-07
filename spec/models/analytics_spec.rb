require "rails_helper"

RSpec.describe Analytics, type: :model do
  describe "#build" do
    it "captures the current gifts and receivers count" do
      normal_receivers = create_list(:receiver, 5)
      golden_receivers = create_list(:receiver, 5, golden: true)
      create(:match, received: true, receiver: normal_receivers.first)
      create(:match, received: false, receiver: golden_receivers.first)

      analytics = Analytics.build

      expect(analytics.gifts_received).to eq(1)
      expect(analytics.gifts_missing).to eq(1)
      expect(analytics.gifts_matched).to eq(2)
      expect(analytics.normal_receivers).to eq(5)
      expect(analytics.golden_receivers).to eq(5)
      expect(analytics.total_receivers).to eq(10)
    end
  end
end
