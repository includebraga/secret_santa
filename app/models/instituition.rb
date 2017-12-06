class Instituition < ApplicationRecord
  has_many :receivers

  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 80 }

  validates :short_name,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 6 }
end
