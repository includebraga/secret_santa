class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 80 },
    email: { strict_mode: true }

  # Validations are only run when `User#valid?` is invoked
  # To load a user with validations, call `valid?` on `self`
  # and return the updated `self`
  def with_validations
    valid?
    self
  end
end
