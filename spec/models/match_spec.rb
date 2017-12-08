require "rails_helper"

RSpec.describe Match, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:receiver_id) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:receiver_id) }
end
