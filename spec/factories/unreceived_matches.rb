FactoryBot.define do
  factory :unreceived_match do
    user
    receiver

    sequence(:code) { |n| "#{Faker::TwinPeaks.location} #{n}" }
  end
end
