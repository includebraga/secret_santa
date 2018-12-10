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

  # rubocop:disable Metrics/AbcSize
  def reply
    @_reply ||= [
      "Gifts Received - #{analytics.gifts_received}",
      "Gifts Received Late - #{analytics.gifts_received_late}",
      "Gifts Missing - #{analytics.gifts_missing}",
      "Gifts Matched - #{analytics.gifts_matched}",
      "Matched Needed - #{analytics.matches_needed}",
      "Total Receivers - #{analytics.total_receivers}",
      "Confirmed Users - #{analytics.confirmed_users}",
    ].join("\n")
  end
  # rubocop:enable Metrics/AbcSize

  private

  attr_reader :analytics
end
