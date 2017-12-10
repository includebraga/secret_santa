class MatchRedeem
  MAX_GIFTS_FOR_GOLDEN = 1

  def initialize(user)
    @success = false
    @user = user
  end

  def successful?
    @success
  end

  def receiver
    match.receiver
  end

  def perform
    return unless user

    ActiveRecord::Base.transaction(joinable: false) do
      find_or_create_match!
      notify_user!

      @success = true
    end
  rescue ActiveRecord::ActiveRecordError => e
    Rails.logger.error(e.message)
  end

  private

  attr_reader :user, :match

  def find_or_create_match!
    @match = Match.find_or_create_by!(user: user) do |match|
      match.receiver = assign_and_update_receiver!
    end
  end

  def assign_and_update_receiver!
    Receiver.transaction do
      # Get the next available receiver
      # Create an empty receiver object to cause an ActiveRecordError
      # So the transaction rollsback and the logger gracefully captures the error
      receiver = next_receiver || Receiver.new(matched_gifts: 0)
      receiver.matched_gifts += 1

      receiver.save!

      receiver
    end
  end

  def next_receiver
    golden_query =
      Receiver.
        where(golden: true).
        where("matched_gifts < ?", MAX_GIFTS_FOR_GOLDEN)

    regular_query =
      Receiver.
        where(golden: false)

    golden_query.
      or(regular_query).
      order(:matched_gifts).
      first
  end

  def notify_user!
    return if match.email_sent?

    match.update!(email_sent: true)

    MatchMailer.match_redeemed(user, match.receiver).deliver_now
  end
end
