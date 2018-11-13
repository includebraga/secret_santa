require "rails_helper"

RSpec.describe CleanUnreceivedMatches, type: :model do
  describe "#perform" do
    it "deletes all missing matches and creates them as unreceived matches" do
      create(:match, received: false)
      missing_matches_count = Match.missing.count
      clean_unreceived_matches = CleanUnreceivedMatches.new

      expect do
        clean_unreceived_matches.perform
      end.to change { UnreceivedMatch.count }.by(missing_matches_count)
    end

    it "creates unreceived match with the correct data" do
      unreceived_match = create(:match, received: false)
      clean_unreceived_matches = CleanUnreceivedMatches.new

      clean_unreceived_matches.perform

      expect(unreceived_match.user_id).to eq(UnreceivedMatch.first.user_id)
      expect(unreceived_match.receiver_id).to eq(UnreceivedMatch.first.receiver_id)
      expect(unreceived_match.code).to eq(UnreceivedMatch.first.code)
    end

    it "does nothing when there are no missing matches" do
      create(:match, received: true)
      clean_unreceived_matches = CleanUnreceivedMatches.new

      match_count = Match.count
      expect do
        clean_unreceived_matches.perform
      end.not_to change { Match.count }.from(match_count)
      expect(UnreceivedMatch.all).to eq([])
    end
  end
end
