require "rails_helper"

RSpec.describe Slack::MessageRouter, type: :model do
  describe "#perform" do
    it "is successful if the command is known" do
      progress_update = mock_progress_update
      router = Slack::MessageRouter.new(text: "santa stats")
      expect(progress_update).to receive(:perform)
      expect(progress_update).to receive(:reply)

      router.perform

      expect(router).to be_successful
    end

    it "is unsuccessful if the command is unknown" do
      router = Slack::MessageRouter.new(text: "unknown command")

      router.perform

      expect(router).not_to be_successful
    end

    it "returns a default response" do
      router = Slack::MessageRouter.new(text: "unknown command")

      router.perform

      expect(router.reply).to eq(Slack::MessageRouter::DEFAULT_RESPONSE)
    end

    def mock_progress_update
      progress_update = double(:progress_update)
      allow(progress_update).to receive(:perform)
      allow(progress_update).to receive(:reply)
      allow(Slack::ProgressUpdate).to receive(:new).and_return(progress_update)

      progress_update
    end
  end
end
