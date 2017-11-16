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
    @_user ||= User.create!(user_params)
  end

  def notify_user!
    UserMailer.new_user(user).deliver_now
  end

  def user_params
    params.merge(confirmation_token: generate_random_token)
  end

  def generate_random_token
    token_candidate = new_random_token

    loop do
      break unless User.find_by(confirmation_token: token_candidate)
      token_candidate = new_random_token
    end

    token_candidate
  end

  def new_random_token
    SecureRandom.urlsafe_base64(32)
  end
end
