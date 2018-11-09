require "rails_helper"

RSpec.describe Settings, type: :model do
  subject { create(:settings) }

  it { should validate_presence_of(:key) }
  it { should validate_presence_of(:value) }

  it { should validate_uniqueness_of(:key) }
end
