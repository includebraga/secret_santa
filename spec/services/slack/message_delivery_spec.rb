require "rails_helper"

RSpec.describe Slack::MessageDelivery, type: :model do
  describe "#perform" do
    before(:each) do
      mock_slack_post
      enable_registrations
    end

    it "is successful" do
      message_delivery = Slack::MessageDelivery.new("message")

      message_delivery.perform

      expect(message_delivery).to be_successful
    end

    it "is unsuccessful if the registrations are disabled" do
      disable_registrations
      message_delivery = Slack::MessageDelivery.new("message")

      message_delivery.perform

      expect(message_delivery).not_to be_successful
    end

    it "posts to slack" do
      expect(HTTParty).to receive(:post)
      message_delivery = Slack::MessageDelivery.new("message")

      message_delivery.perform

      expect(message_delivery).to be_successful
    end

    it "is unsuccessful if the response code is not 200" do
      mock_slack_post(500)
      message_delivery = Slack::MessageDelivery.new("message")

      message_delivery.perform

      expect(message_delivery).not_to be_successful
    end

    def mock_slack_post(code = 200)
      allow(HTTParty).to receive(:post).and_return(OpenStruct.new(code: code))
    end

    def enable_registrations
      Settings.put(Settings::REGISTRATIONS_ENABLED, true)
    end

    def disable_registrations
      Settings.put(Settings::REGISTRATIONS_ENABLED, false)
    end
  end
end
