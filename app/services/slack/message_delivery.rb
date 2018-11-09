class Slack::MessageDelivery
  INCOMING_WEBHOOK = ENV["SLACK_INCOMING_WEBHOOK"].freeze

  def initialize(message)
    @message = message
    @successful = false
  end

  def perform
    return unless Settings.registrations_enabled?

    response = post_to_slack
    @successful = response.code == 200
  end

  def successful?
    @successful
  end

  private

  attr_reader :message

  def post_to_slack
    HTTParty.post(
      INCOMING_WEBHOOK,
      headers: { "Content-Type" => "application/json" },
      body: { text: message }.to_json,
    )
  end
end
