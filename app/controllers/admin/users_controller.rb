module Admin
  class UsersController < Admin::ApplicationController
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

    def batch_assign
      redeem_token_allocation = RedeemTokenAllocation.new
      redeem_token_allocation.perform

      nr_users = redeem_token_allocation.updated_users
      flash[:notice] = "Assigned a redeem token to #{nr_users} users"

      redirect_to admin_users_path
    end
  end
end
