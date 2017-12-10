class BatchMatchNotification
  attr_reader :notifications_sent

  def initialize(users = nil)
    @success = false
    @notifications_sent = 0
    @users = users || elligible_users
  end

  def successful?
    @success
  end

  def perform
    @notifications_sent = users.inject(0) do |acc, user|
      notify(user) ? acc + 1 : acc
    end

    @success = notifications_sent != 0
  end

  private

  attr_reader :users

  def notify(user)
    match_notification = MatchNotification.new(user)
    match_notification.perform

    match_notification.successful?
  end

  def elligible_users
    User.confirmed.unnotified.where.not(redeem_token: nil)
  end
end
