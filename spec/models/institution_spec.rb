require "rails_helper"

RSpec.describe Institution, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(80) }

  it { should validate_presence_of(:short_name) }
  it { should validate_length_of(:short_name).is_at_most(6) }
  it { should validate_uniqueness_of(:short_name).case_insensitive }
end
