require "rails_helper"

RSpec.describe Receiver, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(80) }

  it { should validate_presence_of(:letter) }
  it { should validate_presence_of(:institution_id) }

  it "should have one gift if it only has one match" do
    receiver = create(:receiver)
    create(:match, receiver: receiver, received: true)

    expect(receiver.number_of_gifts).to eq(1)
  end

  it "should have one gift if it only has one unreceived match" do
    receiver = create(:receiver)
    create(:unreceived_match, receiver: receiver, received: true)

    expect(receiver.number_of_gifts).to eq(1)
  end

  it "should have a gift if it has both one match and unreceived match" do
    receiver = create(:receiver)
    create(:unreceived_match, receiver: receiver, received: true)
    create(:match, receiver: receiver, received: true)

    expect(receiver.number_of_gifts).to eq(2)
  end

  it "should not have a gift" do
    receiver = create(:receiver)

    expect(receiver.number_of_gifts).to eq(0)
  end
end
