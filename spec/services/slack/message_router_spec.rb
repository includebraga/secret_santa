require "rails_helper"

RSpec.describe Slack::MessageRouter, type: :model do
  describe "#perform" do
    it "is successful if the command is known" do
      router = Slack::MessageRouter.new(text: "santa stats")

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
  end
end
