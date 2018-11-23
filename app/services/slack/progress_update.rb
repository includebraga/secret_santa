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

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def reply
    @_reply ||= [
      "Gifts Received - #{analytics.gifts_received}",
      "Gifts Missing - #{analytics.gifts_missing}",
      "Gifts Matched - #{analytics.gifts_matched}",
      "Normal Receivers - #{analytics.normal_receivers}",
      "Golden Receivers - #{analytics.golden_receivers}",
      "Total Receivers - #{analytics.total_receivers}",
      "Unconfirmed Users - #{analytics.unconfirmed_users}",
      "Confirmed Users - #{analytics.confirmed_users}",
      "Total Users - #{analytics.total_users}",
    ].join("\n")
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  private

  attr_reader :analytics
end
