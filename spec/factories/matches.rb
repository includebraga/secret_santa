FactoryBot.define do
  factory :match do
    user
    receiver

    sequence(:code) { |n| "#{Faker::TwinPeaks.location} #{n}" }
  end
end
