class Match < ApplicationRecord
  belongs_to :user
  belongs_to :receiver

  validates :user_id,
    presence: true,
    uniqueness: { scope: :receiver_id }

  validates :code, presence: true
  validates :receiver_id, presence: true
  validates :received, inclusion: { in: [true, false] }

  def received?
    received
  end
end
