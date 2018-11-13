class CleanUnreceivedMatches
  def perform
    ActiveRecord::Base.transaction do
      move_missing_matches
    end
  rescue ActiveRecord::ActiveRecordError => e
    Rails.logger.error(e.message)
  end

  private

  def move_missing_matches
    Match.missing.each do |match|
      UnreceivedMatch.create!(
        user_id: match.user_id,
        receiver_id: match.receiver_id,
        code: match.code,
        received: false,
      )
      match.destroy!
    end
  end
end
