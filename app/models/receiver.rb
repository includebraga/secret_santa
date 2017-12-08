class Receiver < ApplicationRecord
  has_many :matches
  has_many :users, through: :matches
  belongs_to :institution

  validates :name,
    presence: true,
    length: { maximum: 80 }

  validates :letter, :institution_id, presence: true
end
