class Institution < ApplicationRecord
  has_many :receivers
  has_many :matches, through: :receivers
  has_many :unreceived_matches, through: :receivers

  validates :name,
    presence: true,
    length: { maximum: 80 }

  validates :short_name,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 6 }

  def obfuscated_short_name
    Digest::SHA2.hexdigest(short_name)[0..5]
  end

  def total_receivers
    receivers.count
  end

  def total_receivers_with_gift
    matches.received.count + unreceived_matches.received_late.count
  end

  def total_receivers_without_gift
    result = receivers.count - total_receivers_with_gift

    result.negative? ? 0 : result
  end
end
