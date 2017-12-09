FactoryBot.define do
  factory :receiver do
    name { Faker::Name.name }
    letter { Faker::RickAndMorty.quote }
    matched_gifts 0
    received_gifts 0
    golden_santa false
    institution
  end
end
