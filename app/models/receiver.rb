class Receiver < ApplicationRecord
  has_many :matches
  has_many :users, through: :matches
  belongs_to :institution

  validates :name,
    presence: true,
    length: { maximum: 80 }

  validates_presence_of :letter,
    :institution_id,
    :received_gifts,
    :matched_gifts

  validates :golden_santa, inclusion: { in: [true, false] }
end
