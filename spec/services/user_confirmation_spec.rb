require "rails_helper"

RSpec.describe UserConfirmation, type: :model do
  describe "#perform" do
    context "with a valid token" do
      it "confirms the user" do
        user = create(:user, confirmed_at: nil)
        user_confirmation = UserConfirmation.new(user.confirmation_token)

        user_confirmation.perform

        expect(user.reload).to be_confirmed
      end

      it "clears the confirmation token" do
        user = create(:user, confirmed_at: nil)
        user_confirmation = UserConfirmation.new(user.confirmation_token)

        user_confirmation.perform

        expect(user.reload.confirmation_token).not_to be
      end
    end

    context "with an invalid token" do
      it "does not alter any existing users" do
        user = create(:user_with_confirmation_token)
        user_confirmation = UserConfirmation.new("fake token")

        user_confirmation.perform

        user.reload
        expect(user).not_to be_confirmed
        expect(user.confirmation_token).to be
      end
    end
  end

  describe "#successful?" do
    context "with a valid token" do
      it "is true" do
        user = create(:user, confirmed_at: nil)
        user_confirmation = UserConfirmation.new(user.confirmation_token)

        user_confirmation.perform

        expect(user_confirmation).to be_successful
      end
    end

    context "with an invalid token" do
      it "is false" do
        create(:user, confirmed_at: nil)
        user_confirmation = UserConfirmation.new("fake token")

        user_confirmation.perform

        expect(user_confirmation).not_to be_successful
      end
    end
  end

  describe "#user" do
    context "with a valid token" do
      it "returns the updated user" do
        user = create(:user, confirmed_at: nil)
        user_confirmation = UserConfirmation.new(user.confirmation_token)

        user_confirmation.perform

        expect(user_confirmation.user).to eq(user.reload)
      end
    end

    context "with an invalid token" do
      it "returns nil" do
        create(:user, confirmed_at: nil)
        user_confirmation = UserConfirmation.new("fake token")

        user_confirmation.perform

        expect(user_confirmation.user).to be_nil
      end
    end
  end
end
