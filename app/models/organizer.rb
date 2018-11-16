class Organizer < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 80 },
    email: { strict_mode: true }

  validates :uuid,
    uniqueness: { case_sensitive: true },
    allow_nil: true

  def previously_signed_in?
    uuid.present?
  end
end
