class UserCreation
  def initialize(params)
    @params = params
    @success = false
  end

  def perform
    return if user_exists?

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

  def user_exists?
    return false unless params[:email]

    @_user_exists ||= User.where("email = ? AND confirmed_at IS NOT NULL", params[:email]).exists?
  end

  def user
    @_user
  end

  private

  attr_reader :params, :success

  def find_or_create_user!
    @_user ||= User.find_or_create_by!(email: params[:email]) do |user|
      user.name = params[:name]
      user.observations = params[:observations]
      user.confirmation_token = new_random_token
    end
  end

  def notify_user!
    raise ActiveRecord::ActiveRecordError if user.confirmed?

    UserMailer.new_user(user).deliver_now
  end

  def new_random_token
    Crypto.unique_token { |token| User.find_by(confirmation_token: token) }
  end
end
