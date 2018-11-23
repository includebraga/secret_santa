class UserConfirmationFlow
  attr_reader :user, :match

  def initialize(user_token)
    @user_token = user_token
    @success = false
    @must_cleanup = false
  end

  def perform
    ActiveRecord::Base.transaction do
      @user = user_from_token or rollback!("no user with such token")

      rollback!("registrations closed", cleanup: true) unless Settings.registrations_enabled?

      @match = assign_match or rollback!("no receivers available", cleanup: true)

      @success = true
    end
  rescue ActiveRecord::ActiveRecordError => e
    Rails.logger.error(e.message)
  ensure
    cleanup if must_cleanup
  end

  def successful?
    success
  end

  def user_deleted?
    must_cleanup
  end

  private

  attr_reader :user_token, :success, :must_cleanup

  def user_from_token
    user_confirmation = UserConfirmation.new(user_token)
    user_confirmation.perform

    user_confirmation.user if user_confirmation.successful?
  end

  def assign_match
    match_assignment = MatchAssignment.new(user)
    match_assignment.perform

    Settings.put(:REGISTRATIONS_ENABLED, false) if Match.count == Receiver.count

    match_assignment.match if match_assignment.successful?
  end

  def cleanup
    user&.destroy

    Settings.put(:REGISTRATIONS_ENABLED, false)
  end

  def rollback!(msg, cleanup: false)
    @must_cleanup = cleanup

    raise ActiveRecord::Rollback, msg
  end
end
