require "rails_helper"

RSpec.describe Slack::ProgressUpdate, type: :model do
  describe "#perform" do
    it "is successful" do
      progress_update = Slack::ProgressUpdate.new

      progress_update.perform

      expect(progress_update).to be_successful
    end

    it "builds the current analytics" do
      progress_update = Slack::ProgressUpdate.new
      expect(Analytics).to receive(:build)

      progress_update.perform

      expect(progress_update).to be_successful
    end
  end
end
