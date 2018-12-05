class UnreceivedMatch < ApplicationRecord
  belongs_to :user
  belongs_to :receiver

  validates :user_id,
    presence: true,
    uniqueness: { scope: :receiver_id }

  validates :receiver_id, presence: true
  validates :code, presence: true
  validates :received, inclusion: { in: [true, false] }

  scope :received_late, -> { where(received: true) }
  scope :missing, -> { where(received: false) }
  scope :not_received, -> { where(received: false) }
end
