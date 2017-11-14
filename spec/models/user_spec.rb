require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it "can have an empty confirmation timestamp" do
      user = build(:user, confirmed_at: nil)

      expect(user).to be_valid
    end
  end
end
