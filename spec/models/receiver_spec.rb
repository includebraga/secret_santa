require "rails_helper"

RSpec.describe Receiver, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(80) }

  it { should validate_presence_of(:letter) }
  it { should validate_presence_of(:institution_id) }
end
