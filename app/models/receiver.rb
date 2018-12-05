class Receiver < ApplicationRecord
  has_many :matches
  has_many :unreceived_matches
  has_many :users, through: :matches
  belongs_to :institution

  enum gender: %w[unknown male female other]

  validates :name,
    presence: true,
    length: { maximum: 80 }

  validates_presence_of :letter, :institution_id

  validates :golden, inclusion: { in: [true, false] }

  scope :golden, -> { where(golden: true) }
  scope :normal, -> { where(golden: false) }
end
