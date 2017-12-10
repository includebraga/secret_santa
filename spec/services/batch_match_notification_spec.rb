require "rails_helper"

RSpec.describe BatchMatchNotification, type: :model do
  describe "#perform" do
    context "for unnotified users" do
      it "is successful" do
        create_list(:user_with_redeem_token, 5)
        batch_match_notification = BatchMatchNotification.new

        batch_match_notification.perform

        expect(batch_match_notification).to be_successful
      end

      it "emails the users" do
        email = double("email", deliver_now!: true)
        allow(MatchMailer).to receive(:match_ready).and_return(email)
        create_list(:user_with_redeem_token, 5)
        batch_match_notification = BatchMatchNotification.new

        batch_match_notification.perform

        expect(email).to have_received(:deliver_now!).exactly(5).times
      end

      it "sends the correct number of reminders" do
        create_list(:user_with_redeem_token, 5)
        batch_match_notification = BatchMatchNotification.new

        expect do
          batch_match_notification.perform
        end.to change { batch_match_notification.notifications_sent }.by(5)
      end
    end

    context "for notified users" do
      it "does not send emails" do
        email = double("email", deliver_now!: true)
        allow(MatchMailer).to receive(:match_ready).and_return(email)
        create_list(:user, 5, match_notice_sent: true)
        batch_match_notification = BatchMatchNotification.new

        batch_match_notification.perform

        expect(email).not_to have_received(:deliver_now!)
      end

      it "does not increment the reminder count" do
        create_list(:user_with_redeem_token, 3)
        create_list(:user_with_redeem_token, 2, match_notice_sent: true)
        batch_match_notification = BatchMatchNotification.new

        expect do
          batch_match_notification.perform
        end.to change { batch_match_notification.notifications_sent }.by(3)
      end
    end
  end
end
