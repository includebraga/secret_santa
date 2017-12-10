require "rails_helper"

RSpec.describe MatchNotification, type: :model do
  describe "#perform" do
    context "for an unnotified user" do
      it "is successful" do
        user = create(:user_with_redeem_token)
        match_notification = MatchNotification.new(user)

        match_notification.perform

        expect(match_notification).to be_successful
      end

      it "emails the user" do
        email = double("email", deliver_now!: true)
        allow(MatchMailer).to receive(:match_ready).and_return(email)
        user = create(:user_with_redeem_token)
        match_notification = MatchNotification.new(user)

        match_notification.perform

        expect(email).to have_received(:deliver_now!)
      end
    end

    context "for a notified user" do
      it "is not successful" do
        user = create(:user_with_redeem_token, match_notice_sent: true)
        match_notification = MatchNotification.new(user)

        match_notification.perform

        expect(match_notification).not_to be_successful
      end

      it "does not send an email" do
        email = double("email", deliver_now!: true)
        allow(MatchMailer).to receive(:match_ready).and_return(email)
        user = create(:user_with_redeem_token, match_notice_sent: true)
        match_notification = MatchNotification.new(user)

        match_notification.perform

        expect(email).not_to have_received(:deliver_now!)
      end
    end

    context "forcing a resend for a notified user" do
      it "is successful" do
        user = create(:user_with_redeem_token, match_notice_sent: true)
        match_notification = MatchNotification.new(user, force_resend: true)

        match_notification.perform

        expect(match_notification).to be_successful
      end

      it "emails the user" do
        email = double("email", deliver_now!: true)
        allow(MatchMailer).to receive(:match_ready).and_return(email)
        user = create(:user_with_redeem_token, match_notice_sent: true)
        match_notification = MatchNotification.new(user, force_resend: true)

        match_notification.perform

        expect(email).to have_received(:deliver_now!)
      end
    end
  end
end
