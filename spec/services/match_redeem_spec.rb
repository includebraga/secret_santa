require "rails_helper"

RSpec.describe MatchRedeem, type: :model do
  describe "#perform" do
    context "for nil users" do
      it "does not create new matches" do
        match_redeem = MatchRedeem.new(nil)

        expect { match_redeem.perform }.not_to change { Match.count }
      end
    end

    context "for a user with with no matches" do
      it "is successful" do
        create(:receiver)
        user = create(:user)
        match_redeem = MatchRedeem.new(user)

        match_redeem.perform

        expect(match_redeem).to be_successful
      end

      it "creates a new match" do
        create(:receiver)
        user = create(:user)
        match_redeem = MatchRedeem.new(user)

        expect { match_redeem.perform }.to change { Match.count }.by(1)
      end

      it "increments the receiver's matched gift attribute" do
        create(:receiver)
        user = create(:user)
        match_redeem = MatchRedeem.new(user)

        expect do
          match_redeem.perform
        end.to change { Receiver.first.matched_gifts }.by(1)
      end

      it "correctly assigns the receiver" do
        receiver = create(:receiver)
        user = create(:user)
        match_redeem = MatchRedeem.new(user)

        match_redeem.perform

        expect(match_redeem.receiver).to eq(receiver)
      end
    end

    context "for a user with an existing match" do
      it "is successful" do
        receiver = create(:receiver)
        user = create(:user)
        create(:match, receiver: receiver, user: user)
        match_redeem = MatchRedeem.new(user)

        match_redeem.perform

        expect(match_redeem).to be_successful
      end

      it "doesn't create a new match" do
        receiver = create(:receiver)
        user = create(:user)
        create(:match, receiver: receiver, user: user)
        match_redeem = MatchRedeem.new(user)

        expect { match_redeem.perform }.not_to change { Match.count }
      end

      it "doesn't increment the receiver's matched gift attribute" do
        receiver = create(:receiver)
        user = create(:user)
        create(:match, receiver: receiver, user: user)
        match_redeem = MatchRedeem.new(user)

        expect do
          match_redeem.perform
        end.not_to change { receiver.reload.matched_gifts }
      end

      it "correctly assigns the receiver" do
        receiver = create(:receiver)
        user = create(:user)
        create(:match, receiver: receiver, user: user)
        match_redeem = MatchRedeem.new(user)

        match_redeem.perform

        expect(match_redeem.receiver).to eq(receiver)
      end
    end

    context "in successive redeems" do
      it "prioritizes receivers with fewer matched gifts" do
        create_list(:receiver, 2)
        first_user, second_user = create_list(:user, 2)
        first_redeem = MatchRedeem.new(first_user)
        second_redeem = MatchRedeem.new(second_user)

        first_redeem.perform
        second_redeem.perform

        expect(first_redeem.receiver).not_to eq(second_redeem.receiver)
      end

      it "repeats receivers" do
        create_list(:receiver, 2)
        first_user, second_user, third_user = create_list(:user, 3)
        first_redeem = MatchRedeem.new(first_user)
        second_redeem = MatchRedeem.new(second_user)
        third_redeem = MatchRedeem.new(third_user)

        first_redeem.perform
        second_redeem.perform
        third_redeem.perform

        expect(first_redeem.receiver).to eq(third_redeem.receiver)
        expect(third_redeem.receiver.matched_gifts).to eq(2)
      end
    end

    context "when no receivers exist" do
      it "is not successful" do
        user = create(:user)
        match_redeem = MatchRedeem.new(user)

        match_redeem.perform

        expect(match_redeem).not_to be_successful
      end

      it "doesn't create a new match" do
        user = create(:user)
        match_redeem = MatchRedeem.new(user)

        expect { match_redeem.perform }.not_to change { Match.count }
      end
    end
  end
end
