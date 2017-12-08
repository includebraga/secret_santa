class Match < ApplicationRecord
  belongs_to :user
  belongs_to :receiver

  validates :user_id,
    presence: true,
    uniqueness: { scope: :receiver_id }

  validates :receiver_id,
    presence: true
end
