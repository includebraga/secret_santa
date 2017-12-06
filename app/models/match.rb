class Match < ApplicationRecord
  belongs_to :user
  belongs_to :receiver
  validates_uniqueness_of :user_id, scope: :receiver_id
end
