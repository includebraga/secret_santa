class MatchNotification
  def initialize(user, force_resend: false)
    @user = user
    @success = false
    @force_resend = force_resend
  end

  def successful?
    @success
  end

  def perform
    return if user.notified? && !force_resend

    User.transaction do
      notify_user!
      update_user!
    end

    @success = true
  end

  private

  attr_reader :user, :force_resend

  def notify_user!
    MatchMailer.match_ready(user).deliver_now!
  end

  def update_user!
    user.update!(match_notice_sent: true)
  end
end
