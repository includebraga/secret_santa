class User < ApplicationRecord
  has_many :matches
  has_many :receivers, through: :matches

  scope :unconfirmed, -> { where(confirmed_at: nil) }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 80 },
    email: { strict_mode: true }

  validates :name,
    presence: true,
    length: { maximum: 80 }

  validates :confirmation_token,
    uniqueness: { case_sensitive: true },
    allow_nil: true

  # Validations are only run when `User#valid?` is invoked
  # To load a user with validations, call `valid?` on `self`
  # and return the updated `self`
  def with_validations
    valid?
    self
  end

  def confirmed?
    confirmed_at != nil
  end
end
