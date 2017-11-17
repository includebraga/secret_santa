class UserCreation
  def initialize(params)
    @params = params
    @success = false
  end

  def perform
    User.transaction do
      find_or_create_user!
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

  def find_or_create_user!
    @_user ||= User.find_or_create_by!(email: params[:email]) do |user|
      user.name = params[:name]
      user.confirmation_token = generate_random_token
    end
  end

  def notify_user!
    raise ActiveRecord::ActiveRecordError if user.confirmed?

    UserMailer.new_user(user).deliver_now
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
