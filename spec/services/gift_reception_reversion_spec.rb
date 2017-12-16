require "rails_helper"

RSpec.describe GiftReceptionReversion, type: :model do
  describe "#perform" do
    it "is successful" do
      user = create(:user)
      receiver = create(:receiver)
      create(:match, user: user, receiver: receiver)
      gift_reception = GiftReceptionReversion.new(user)

      gift_reception.perform

      expect(gift_reception).to be_successful
    end

    it "sets the match as received" do
      user = create(:user)
      receiver = create(:receiver)
      match = create(:match, user: user, receiver: receiver)
      gift_reception = GiftReceptionReversion.new(user)

      gift_reception.perform

      match.reload
      expect(match).not_to be_received
    end

    # it "increments the number of received gifts" do
    #   user = create(:user)
    #   receiver = create(:receiver)
    #   create(:match, user: user, receiver: receiver)
    #   gift_reception = GiftReceptionReversion.new(user)

    #   expect do
    #     gift_reception.perform
    #   end.to change { receiver.reload.received_gifts }.by(-1)
    # end
  end
end
