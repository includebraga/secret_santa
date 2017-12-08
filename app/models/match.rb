class Match < ApplicationRecord
  belongs_to :user
  belongs_to :receiver

  validates :user_id, uniqueness: { scope: :receiver_id }
end
