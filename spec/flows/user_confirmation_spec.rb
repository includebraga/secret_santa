require "rails_helper"

RSpec.describe UserConfirmationFlow, type: :model do
  describe "#perform" do
    it "confirms the user if there is receivers available" do
      enable_registrations
      create_list(:receiver, 2)
      user = create(:user, confirmed_at: nil)
      user_confirmation = UserConfirmationFlow.new(user.confirmation_token)

      user_confirmation.perform

      expect(user_confirmation).to be_successful
      expect(user.reload).to be_confirmed
      expect(user.reload.confirmation_token).not_to be
      expect(Settings.registrations_enabled?).to be
    end

    it "confirms the user if there is receivers available and closes registrations if no remaining receivers" do
      enable_registrations
      create(:receiver)
      user = create(:user, confirmed_at: nil)
      user_confirmation = UserConfirmationFlow.new(user.confirmation_token)

      user_confirmation.perform

      expect(Settings.registrations_enabled?).not_to be
    end

    it "does not alter any existing users if given bad token" do
      enable_registrations
      create(:receiver)
      user = create(:user_with_confirmation_token)
      user_confirmation = UserConfirmationFlow.new("fake token")

      user_confirmation.perform

      user.reload
      expect(user).not_to be_confirmed
      expect(user.confirmation_token).to be
      expect(Settings.registrations_enabled?).to be
    end

    it "deletes the user if registrations already closed" do
      disable_registrations
      create(:receiver)
      user = create(:user, confirmed_at: nil)
      user_confirmation = UserConfirmationFlow.new(user.confirmation_token)

      user_confirmation.perform

      expect(user_confirmation).to_not be_successful
      expect(user_confirmation).to be_user_deleted
      expect(User.find_by(id: user.id)).to_not be
    end

    it "deletes the user and closes registrations if there are no receivers" do
      enable_registrations
      user = create(:user, confirmed_at: nil)
      user_confirmation = UserConfirmationFlow.new(user.confirmation_token)

      user_confirmation.perform

      expect(user_confirmation).to_not be_successful
      expect(user_confirmation).to be_user_deleted
      expect(User.find_by(id: user.id)).to_not be
      expect(Settings.registrations_enabled?).to_not be
    end
  end

  def enable_registrations
    Settings.put(:REGISTRATIONS_ENABLED, true)
  end

  def disable_registrations
    Settings.put(:REGISTRATIONS_ENABLED, false)
  end
end
