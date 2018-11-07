require "csv"

class ImportReceiversFromCsv
  attr_reader :failed_receivers, :imported_receivers

  def initialize(csv, institution)
    @csv = csv
    @institution = institution
    @receivers = []
    @success = false
    @failed_receivers = 0
    @imported_receivers = 0
  end

  def perform
    build_receivers

    import

    @success = true
  end

  def successful?
    success
  end

  private

  attr_reader :csv, :receivers, :institution, :success

  def log_errors(receiver)
    Rails.logger.warn("Failed to save one of the models: #{receiver.errors.full_messages.join(' | ')}")
  end

  def build_receivers
    CSV.parse(csv, headers: true) do |row|
      receiver = Receiver.new(row.to_hash.merge(institution_id: institution.id))

      unless receiver.valid?
        log_errors(receiver)
      end

      receivers << receiver
    end
  end

  def import
    bulk_import = Receiver.import(receivers)

    @failed_receivers = bulk_import.failed_instances.count
    @imported_receivers = bulk_import.ids.count
  end
end
