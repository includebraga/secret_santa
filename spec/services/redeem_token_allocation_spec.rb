require "rails_helper"

RSpec.describe RedeemTokenAllocation, type: :model do
  describe "#perform" do
    context "when users are updated" do
      it "is successful" do
        create_list(:user, 5)
        redeem_token_allocation = RedeemTokenAllocation.new

        redeem_token_allocation.perform

        expect(redeem_token_allocation).to be_successful
      end

      it "assigns a redeem token to users that have none" do
        create_list(:user, 5)
        redeem_token_allocation = RedeemTokenAllocation.new

        redeem_token_allocation.perform

        User.all.each do |user|
          expect(user.redeem_token).to be
        end
      end

      it "doesn't update tokens of already assigned users" do
        create_list(:user, 5)
        assigned_user = create(:user, redeem_token: "badjerous")
        redeem_token_allocation = RedeemTokenAllocation.new

        redeem_token_allocation.perform

        expect(assigned_user.reload.redeem_token).to eq("badjerous")
      end
    end

    context "when no users are updated" do
      it "is not successful" do
        create(:user, redeem_token: "badjerous")
        redeem_token_allocation = RedeemTokenAllocation.new

        redeem_token_allocation.perform

        expect(redeem_token_allocation).not_to be_successful
      end
    end
  end

  describe "#updated_users" do
    it "returns the updated number of users" do
      create_list(:user, 2)
      redeem_token_allocation = RedeemTokenAllocation.new

      redeem_token_allocation.perform

      expect(redeem_token_allocation.updated_users).to eq(2)
    end
  end
end
