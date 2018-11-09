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

    def set_registrations
      registrations_enabled = registrations_enabled_param

      return if registrations_enabled.nil?

      Settings.put(:REGISTRATIONS_ENABLED, registrations_enabled)

      flash[:notice] = registrations_enabled ? "User registrations enabled!" : "User registrations disabled!"

      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :observations)
    end

    def registrations_enabled_param
      ActiveRecord::Type::Boolean.new.cast(params[:value])
    end
  end
end
