class Analytics
  include ActiveModel::Model

  attr_accessor :gifts_received,
    :gifts_missing,
    :gifts_matched,
    :normal_receivers,
    :golden_receivers,
    :total_receivers

  def self.build
    new(
      gifts_received: Match.received.count,
      gifts_missing: Match.missing.count,
      gifts_matched: Match.count,
      normal_receivers: Receiver.normal.count,
      golden_receivers: Receiver.golden.count,
      total_receivers: Receiver.count,
    )
  end
end
