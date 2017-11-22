class ConfirmationReminder
  def initialize(user)
    @user = user
    @success = false
  end

  def successful?
    @success
  end

  def perform
    return if user.confirmed?

    UserMailer.confirmation_reminder(user).deliver_now
    @success = true
  end

  private

  attr_reader :user
end
