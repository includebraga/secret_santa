class Receiver < ApplicationRecord
  has_many :matches
  has_many :users, through: :matches
  belongs_to :instituition

  validates :name,
    presence: true,
    length: { maximum: 80 }

  validates :letter, :instituition_id, presence: true
end
