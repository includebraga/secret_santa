require "rails_helper"

RSpec.describe Settings, type: :model do
  subject { create(:settings) }

  it { should validate_presence_of(:key) }
  it { should validate_presence_of(:value) }

  it { should validate_uniqueness_of(:key) }

  it "should toggle the registrations_enabled value for the first time" do
    expect do
      Settings.toggle_registrations
    end.to change { Settings.count }.by(1)
  end

  it "should toggle the registrations_enabled value for the first time" do
    expect(Settings.toggle_registrations).to be(false)
  end

  it "should toggle the registrations_enabled value for the first time" do
    Settings.toggle_registrations

    expect(Settings.toggle_registrations).to be(true)
  end
end
