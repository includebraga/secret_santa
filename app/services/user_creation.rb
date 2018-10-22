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
