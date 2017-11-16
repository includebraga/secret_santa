require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(80) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:email).is_at_most(80) }

    it { should validate_uniqueness_of(:confirmation_token) }

    it "can have an empty confirmation timestamp" do
      user = build(:user, confirmed_at: nil)

      expect(user).to be_valid
    end
  end

  describe "#with_validations" do
    it "correctly assigns errors" do
      user = build(:user, email: nil).with_validations

      expect(user.errors[:email]).not_to be_empty
    end

    it "does not assign errors for valid models" do
      user = build(:user).with_validations

      expect(user.errors[:email]).to be_empty
    end
  end

  describe "#confirmed?" do
    it "returns true when there is a confirmation date" do
      user = create(:user)

      expect(user).to be_confirmed
    end

    it "returns false when there is no confirmation date" do
      user = create(:user, confirmed_at: nil)

      expect(user).not_to be_confirmed
    end
  end
end
