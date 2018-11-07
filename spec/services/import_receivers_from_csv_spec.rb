require "rails_helper"

RSpec.describe ImportReceiversFromCsv, type: :model do
  describe "#perform" do
    it "imports one receivers with the given data" do
      institution = create(:institution)
      service = ImportReceiversFromCsv.new(csv_file_to_string("receivers.csv"), institution)

      service.perform
      receiver = Receiver.first


      expect(receiver.name).to eq("RECEIVER1")
      expect(receiver.age).to eq(16)
      expect(receiver.gender).to eq("male")
      expect(receiver.letter).to eq("Gosto de cenas\ncenas is cool\n")
    end

    it "imports all receivers" do
      institution = create(:institution)
      service = ImportReceiversFromCsv.new(csv_file_to_string("receivers.csv"), institution)

      expect do
        service.perform
      end.to change { Receiver.count }.by(2)

      expect(service).to be_successful
      expect(service.imported_receivers).to eq(2)
      expect(service.failed_receivers).to eq(0)
    end

    it "fails to import bad receivers" do
      institution = create(:institution)
      service = ImportReceiversFromCsv.new(csv_file_to_string("receivers_bad.csv"), institution)

      expect do
        service.perform
      end.to change { Receiver.count }.by(0)

      expect(service).to be_successful
      expect(service.imported_receivers).to eq(0)
      expect(service.failed_receivers).to eq(2)
    end

    it "imports the good receivers and ignores the bad receivers" do
      institution = create(:institution)
      service = ImportReceiversFromCsv.new(csv_file_to_string("receivers_half_bad.csv"), institution)

      expect do
        service.perform
      end.to change { Receiver.count }.by(1)

      expect(service).to be_successful
      expect(service.imported_receivers).to eq(1)
      expect(service.failed_receivers).to eq(1)
    end
  end

  def csv_file_to_string(filename)
    File.read(file_fixture(filename))
  end
end
