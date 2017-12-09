class MatchRedeem
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
      @match = Match.find_or_create_by!(user: user) do |match|
        match.receiver = assign_and_update_receiver!
      end

      @success = true
    end
  rescue ActiveRecord::ActiveRecordError => e
    Rails.logger.error(e.message)
  end

  private

  attr_reader :user, :match

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
    Receiver.order(:matched_gifts).first
  end
end
