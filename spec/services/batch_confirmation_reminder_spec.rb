require "rails_helper"

RSpec.describe BatchConfirmationReminder, type: :model do
  describe "#perform" do
    context "for unconfirmed users" do
      it "is successful" do
        create_list(:user_with_confirmation_token, 5)
        batch_confirmation_reminder = BatchConfirmationReminder.new

        batch_confirmation_reminder.perform

        expect(batch_confirmation_reminder).to be_successful
      end

      it "emails the users" do
        email = double("email", deliver_now: true)
        allow(UserMailer).to receive(:confirmation_reminder).and_return(email)
        create_list(:user_with_confirmation_token, 5)
        batch_confirmation_reminder = BatchConfirmationReminder.new

        batch_confirmation_reminder.perform

        expect(email).to have_received(:deliver_now).exactly(5).times
      end

      it "sends the correct number of reminders" do
        create_list(:user_with_confirmation_token, 5)
        batch_confirmation_reminder = BatchConfirmationReminder.new

        expect do
          batch_confirmation_reminder.perform
        end.to change { batch_confirmation_reminder.reminders_sent }.by(5)
      end
    end

    context "for confirmed users" do
      it "does not send emails" do
        email = double("email", deliver_now: true)
        allow(UserMailer).to receive(:new_user).and_return(email)
        create_list(:user, 5)
        batch_confirmation_reminder = BatchConfirmationReminder.new

        batch_confirmation_reminder.perform

        expect(email).not_to have_received(:deliver_now)
      end

      it "does not increment the reminder count" do
        create_list(:user, 3)
        create_list(:user_with_confirmation_token, 2)
        batch_confirmation_reminder = BatchConfirmationReminder.new

        expect do
          batch_confirmation_reminder.perform
        end.to change { batch_confirmation_reminder.reminders_sent }.by(2)
      end
    end
  end
end
