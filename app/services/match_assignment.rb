class MatchAssignment
  attr_reader :match, :receiver

  def initialize(user)
    @user = user
    @success = false
  end

  def perform
    ActiveRecord::Base.transaction do
      rollback!("user already has match") if user.matches.any?

      @receiver = available_receiver or rollback!("no receiver available")
      @match = create_match

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

  def rollback!(msg)
    raise ActiveRecord::Rollback, msg
  end
end
