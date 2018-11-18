class MatchAssignment
  attr_reader :match, :receiver

  def initialize(user, receiver = nil)
    @user = user
    @receiver = receiver
    @success = false
  end

  def perform
    ActiveRecord::Base.transaction do
      run_existing_match_validations

      @receiver ||= available_receiver or rollback!("no receiver available")
      @match = create_match
      send_match_email

      @success = true
    end
  rescue ActiveRecord::ActiveRecordError => e
    Rails.logger.error(e.message)
  end

  def successful?
    success
  end

  private

  attr_reader :user, :success

  def run_existing_match_validations
    rollback!("user already has match") if user.matches.any?

    rollback!("receiver already has match") if receiver&.matches&.any?
  end

  def available_receiver
    Receiver.left_joins(:matches).where(matches: { id: nil }).first
  end

  def create_match
    Match.create!(user: user, receiver: receiver, code: match_code)
  end

  def match_code
    # nasty violation of the Law of Demeter here
    # but no other pretty way to do it
    obfuscated_short_name = receiver.institution.obfuscated_short_name

    "#{receiver.id}#{obfuscated_short_name}#{user.id}"
  end

  def send_match_email
    MatchMailer.match_redeemed(match).deliver_now
  end

  def rollback!(msg)
    raise ActiveRecord::Rollback, msg
  end
end
