class Institution < ApplicationRecord
  has_many :receivers

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
end
