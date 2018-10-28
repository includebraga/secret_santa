class GiftReceptionReversion
  def initialize(user)
    @success = false
    @user = user
  end

  def successful?
    @success
  end

  def perform
    return unless user

    Match.transaction do
      update_match!

      @success = true
    end
  rescue ActiveRecord::ActiveRecordError => e
    Rails.logger.error(e.message)
  end

  private

  attr_reader :user

  def match
    user.matches.first
  end

  def update_match!
    match.update!(received: false)
  end
end
