class Slack::ProgressUpdate
  def initialize
    @successful = false
  end

  def perform
    @analytics ||= Analytics.build

    @successful = true
  end

  def successful?
    @successful
  end

  def reply
    @_reply ||= [
      "Gifts Received - #{analytics.gifts_received}",
      "Gifts Missing - #{analytics.gifts_missing}",
      "Gifts Matched - #{analytics.gifts_matched}",
      "Normal Receivers - #{analytics.normal_receivers}",
      "Golden Receivers - #{analytics.golden_receivers}",
      "Total Receivers - #{analytics.total_receivers}",
    ].join("\n")
  end

  private

  attr_reader :analytics
end
