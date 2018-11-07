require "rails_helper"

RSpec.describe ImportReceiversFromCSV, type: :model do
  describe "#perform" do
    it "imports one receiver with the given data" do
      institution = create(:institution)
      service = ImportReceiversFromCSV.new(path: file_fixture("receivers.csv"), institution_id: institution.id)

      service.perform
      receiver = Receiver.first

      expect(receiver.name).to eq("RECEIVER1")
      expect(receiver.age).to eq(16)
      expect(receiver.gender).to eq("male")
      expect(receiver.letter).to eq("Gosto de cenas\ncenas is cool\n")
    end

    it "imports all receivers" do
      institution = create(:institution)
      service = ImportReceiversFromCSV.new(path: file_fixture("receivers.csv"), institution_id: institution.id)

      expect do
        service.perform
      end.to change { Receiver.count }.by(2)

      expect(service).to be_successful
      expect(service.imported_receivers).to eq(2)
      expect(service.failed_receivers).to eq(0)
    end

    it "fails to import bad receivers" do
      institution = create(:institution)
      service = ImportReceiversFromCSV.new(path: file_fixture("receivers_bad.csv"), institution_id: institution.id)

      expect do
        service.perform
      end.not_to change { Receiver.count }

      expect(service).to be_successful
      expect(service.imported_receivers).to eq(0)
      expect(service.failed_receivers).to eq(2)
    end

    it "imports the good receivers and ignores the bad receivers" do
      institution = create(:institution)
      service = ImportReceiversFromCSV.new(path: file_fixture("receivers_half_bad.csv"), institution_id: institution.id)

      expect do
        service.perform
      end.to change { Receiver.count }.by(1)

      expect(service).to be_successful
      expect(service.imported_receivers).to eq(1)
      expect(service.failed_receivers).to eq(1)
    end
  end
end
