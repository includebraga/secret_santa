require "rails_helper"

RSpec.describe GiftReception, type: :model do
  describe "#perform" do
    it "is successful" do
      user = create(:user)
      receiver = create(:receiver)
      create(:match, user: user, receiver: receiver)
      gift_reception = GiftReception.new(user)

      gift_reception.perform

      expect(gift_reception).to be_successful
    end

    it "sets the match as received" do
      user = create(:user)
      receiver = create(:receiver)
      match = create(:match, user: user, receiver: receiver)
      gift_reception = GiftReception.new(user)

      gift_reception.perform

      match.reload
      expect(match).to be_received
    end
  end
end
