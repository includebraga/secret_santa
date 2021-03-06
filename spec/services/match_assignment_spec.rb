require "rails_helper"

RSpec.describe MatchAssignment, type: :model do
  describe "#perform" do
    it "creates a match" do
      user = create(:user)
      receiver = create(:receiver)
      match_assignment = MatchAssignment.new(user)

      expect do
        match_assignment.perform
      end.to change { Match.count }.by(1)

      expect(match_assignment).to be_successful
      expect(match_assignment.match.receiver).to eq(receiver)
      expect(match_assignment.match.user).to eq(user)
    end

    it "creates a match for a given receiver" do
      user = create(:user)
      receiver = create_list(:receiver, 3).last
      match_assignment = MatchAssignment.new(user, receiver)

      expect do
        match_assignment.perform
      end.to change { Match.count }.by(1)

      expect(match_assignment).to be_successful
      expect(match_assignment.match.receiver).to eq(receiver)
      expect(match_assignment.match.user).to eq(user)
    end

    it "is unsuccessful if there are no receivers" do
      user = create(:user)
      match_assignment = MatchAssignment.new(user)

      match_assignment.perform

      expect(match_assignment).not_to be_successful
    end

    it "is unsuccessful if the user already has a match" do
      user = create(:user)
      create(:receiver)
      create(:receiver)
      first_match_assignment = MatchAssignment.new(user)
      second_match_assignment = MatchAssignment.new(user)

      first_match_assignment.perform
      second_match_assignment.perform

      expect(first_match_assignment).to be_successful
      expect(second_match_assignment).not_to be_successful
    end

    it "generates a code" do
      create(:receiver)
      user = create(:user)
      match_assignment = MatchAssignment.new(user)

      match_assignment.perform

      expect(match_assignment.match.code).to be
    end

    it "ignores receivers that already have matches" do
      unavailable_receiver = create(:receiver)
      create(:match, receiver: unavailable_receiver)
      available_receiver = create(:receiver)
      user = create(:user)
      match_assignment = MatchAssignment.new(user)

      match_assignment.perform

      expect(match_assignment.receiver).to eq(available_receiver)
    end

    it "is unsuccessful if receiver already has match" do
      match = create(:match)
      user = create(:user)
      match_assignment = MatchAssignment.new(user, match.receiver)

      match_assignment.perform

      expect(match_assignment).to_not be_successful
    end
  end
end
