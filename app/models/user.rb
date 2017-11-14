class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 80 },
    email: { strict_mode: true }
end
