class RedeemTokenAllocation
  attr_reader :updated_users

  def initialize(users = nil)
    @users = users || User.confirmed.where(redeem_token: nil)
    @updated_users = 0
    @success = false
  end

  def successful?
    @success
  end

  def perform
    @updated_users = users.inject(0) do |acc, user|
      assign_random_token(user) ? acc + 1 : acc
    end

    @success = updated_users != 0
  end

  private

  attr_reader :users

  def assign_random_token(user)
    user.update(redeem_token: new_random_token)
  end

  def new_random_token
    Crypto.unique_token { |token| User.find_by(redeem_token: token) }
  end
end
