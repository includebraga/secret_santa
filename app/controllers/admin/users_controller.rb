module Admin
  class UsersController < Admin::ApplicationController
    def create
      user_creation = UserCreation.new(user_params)
      user_creation.perform

      if user_creation.successful?
        flash[:notice] = "User created!"
        redirect_to admin_user_path(user_creation.user)
      else
        flash[:error] = "Something went wrong."
        redirect_to admin_users_path
      end
    end

    def confirm
      user = User.find(params[:id])
      confirmation_reminder = ConfirmationReminder.new(user)

      confirmation_reminder.perform

      if confirmation_reminder.successful?
        flash[:notice] = "Confirmation email resent!"
      else
        flash[:error] = "User was already confirmed"
      end

      redirect_to admin_user_path(user)
    end

    def batch_confirm
      batch_confirmation_reminder = BatchConfirmationReminder.new
      batch_confirmation_reminder.perform

      nr_reminders = batch_confirmation_reminder.reminders_sent
      flash[:notice] = "Sent emails to #{nr_reminders} users"

      redirect_to admin_users_path
    end

    def assign
      user = User.find(params[:id])
      redeem_token_allocation = RedeemTokenAllocation.new([user])
      redeem_token_allocation.perform

      if redeem_token_allocation.updated_users == 1
        flash[:notice] = "Redeem token assigned!"
      else
        flash[:error] = "Something went wrong, token was not assigned"
      end

      redirect_to admin_user_path(user)
    end

    def batch_assign
      redeem_token_allocation = RedeemTokenAllocation.new
      redeem_token_allocation.perform

      nr_users = redeem_token_allocation.updated_users
      flash[:notice] = "Assigned a redeem token to #{nr_users} users"

      redirect_to admin_users_path
    end

    def match
      user = User.find(params[:id])
      match_notification = MatchNotification.new(user, force_resend: true)

      match_notification.perform

      if match_notification.successful?
        flash[:notice] = "Sent the match notification"
      else
        flash[:error] = "Something went wrong. Maybe the user doesn't have a redeem token?"
      end

      redirect_to admin_user_path(user)
    end

    def batch_match
      match_notification = BatchMatchNotification.new
      match_notification.perform

      nr_users = match_notification.notifications_sent
      flash[:notice] = "Notified #{nr_users} users"

      redirect_to admin_users_path
    end

    def receive
      user = User.find(params[:id])
      gift_reception = GiftReception.new(user)

      gift_reception.perform

      if gift_reception.successful?
        flash[:notice] = "Gift received!"
      else
        flash[:error] - "Something went wrong. Maybe the user has no matches?"
      end

      redirect_to admin_user_path(user)
    end

    def revert_receive
      user = User.find(params[:id])
      gift_reception_reversion = GiftReceptionReversion.new(user)

      gift_reception_reversion.perform

      if gift_reception_reversion.successful?
        flash[:notice] = "Gift reception reverted!"
      else
        flash[:error] - "Something went wrong. Maybe the user has no matches?"
      end

      redirect_to admin_user_path(user)
    end

    def set_registrations
      registrations_enabled = ActiveRecord::Type::Boolean.new.cast(params[:value])

      return if registrations_enabled.nil?

      Settings.put(:REGISTRATIONS_ENABLED, registrations_enabled)

      flash[:notice] = registrations_enabled ? "User registrations enabled!" : "User registrations disabled!"

      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :observations)
    end
  end
end
