class Slack::MessageRouter
  TRIGGER = "santa".freeze
  COMMANDS = %i[stats].freeze
  DEFAULT_RESPONSE = "I'm sorry Dave, I'm afraid I can't do that".freeze

  def initialize(text:)
    parse_and_assign_command(text)

    @successful = false
  end

  def perform
    return unless known_command?

    @_reply ||= send(command, *args)

    @successful = true
  end

  def reply
    @_reply || DEFAULT_RESPONSE
  end

  def successful?
    @successful
  end

  private

  attr_reader :command, :args, :successful

  def stats
    progress_update = Slack::ProgressUpdate.new
    progress_update.perform

    progress_update.reply
  end

  def known_command?
    COMMANDS.include?(command)
  end

  def parse_and_assign_command(str)
    trigger, command, *args = str.split(" ")

    return unless trigger == TRIGGER

    @command = command.to_sym
    @args = args
  end
end
