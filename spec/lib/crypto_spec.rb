require "rails_helper"

RSpec.describe Crypto, type: :model do
  describe "#unique_token" do
    it "loops until the token is unique" do
      loops = 0

      Crypto.unique_token { |_token| loops += 1 and loops < 3 }

      expect(loops).to eq(3)
    end
  end
end
