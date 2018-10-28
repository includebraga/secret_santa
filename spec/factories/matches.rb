FactoryBot.define do
  factory :match do
    user
    receiver

    received false

    sequence(:code) { |n| "#{Faker::TwinPeaks.location} #{n}" }
  end
end
