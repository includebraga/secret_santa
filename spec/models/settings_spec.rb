require "rails_helper"

RSpec.describe Settings, type: :model do
  subject { create(:settings) }

  it { should validate_presence_of(:key) }
  it { should validate_presence_of(:value) }

  it { should validate_uniqueness_of(:key) }

  it "should create a settings record if toggled for the first time" do
    expect do
      Settings.toggle_registrations
    end.to change { Settings.count }.by(1)
  end

  it "should not create additional settings record if toggled more than once" do
    Settings.toggle_registrations

    expect do
      Settings.toggle_registrations
    end.not_to change { Settings.count }
  end

  it "should activate registration if toggled for the first time" do
    expect(Settings.toggle_registrations).to be
  end

  it "should deactivate registrations if it's already activated" do
    Settings.toggle_registrations

    expect(Settings.toggle_registrations).not_to be
  end
end
