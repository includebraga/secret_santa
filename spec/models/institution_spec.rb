require "rails_helper"

RSpec.describe Institution, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(80) }

  it { should validate_presence_of(:short_name) }
  it { should validate_length_of(:short_name).is_at_most(6) }
  it { should validate_uniqueness_of(:short_name).case_insensitive }

  describe "#obfuscated_short_name" do
    it "is deterministic" do
      first_institution = build(:institution)
      second_institution = build(:institution, short_name: first_institution.short_name)

      expect(first_institution.obfuscated_short_name).to eq(second_institution.obfuscated_short_name)
    end

    it "is different for different short names" do
      first_institution = build(:institution, short_name: "a")
      second_institution = build(:institution, short_name: "b")

      expect(first_institution.obfuscated_short_name).not_to eq(second_institution.obfuscated_short_name)
    end
  end
end
