require "rails_helper"

RSpec.describe ConfirmationReminder, type: :model do
  describe "#perform" do
    context "for an unconfirmed user" do
      it "is successful" do
        user = create(:user_with_confirmation_token)
        confirmation_reminder = ConfirmationReminder.new(user)

        confirmation_reminder.perform

        expect(confirmation_reminder).to be_successful
      end

      it "emails the user" do
        email = double("email", deliver_now: true)
        allow(UserMailer).to receive(:confirmation_reminder).and_return(email)
        user = create(:user_with_confirmation_token)
        confirmation_reminder = ConfirmationReminder.new(user)

        confirmation_reminder.perform

        expect(email).to have_received(:deliver_now)
      end
    end

    context "for a confirmed user" do
      it "is not successful" do
        user = create(:user)
        confirmation_reminder = ConfirmationReminder.new(user)

        confirmation_reminder.perform

        expect(confirmation_reminder).not_to be_successful
      end

      it "does not send an email" do
        email = double("email", deliver_now: true)
        allow(UserMailer).to receive(:new_user).and_return(email)
        user = create(:user)
        confirmation_reminder = ConfirmationReminder.new(user)

        confirmation_reminder.perform

        expect(email).not_to have_received(:deliver_now)
      end
    end
  end
end
