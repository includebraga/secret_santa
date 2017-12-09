class UserConfirmation
  def initialize(token)
    @token = token
    @success = false
  end

  def perform
    User.transaction do
      load_user!
      update_user!

      @success = true
    end
  rescue ActiveRecord::ActiveRecordError => e
    Rails.logger.error(e.message)
  end

  def successful?
    success
  end

  def user
    @_user
  end

  private

  attr_reader :token, :success

  def load_user!
    @_user ||= User.find_by!(confirmation_token: token)
  end

  def update_user!
    @_user.update!(confirmed_at: Time.now, confirmation_token: nil)
  end
end
