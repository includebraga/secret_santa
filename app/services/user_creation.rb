class UserCreation
  def initialize(params)
    @params = params
    @success = false
  end

  def perform
    User.transaction do
      create_user!
      notify_user!

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

  attr_reader :params, :success

  def create_user!
    @_user ||= User.create!(params)
  end

  def notify_user!
    UserMailer.new_user(user).deliver_now
  end
end
