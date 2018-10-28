FactoryBot.define do
  factory :receiver do
    name { Faker::Name.name }
    letter { Faker::RickAndMorty.quote }
    golden false
    institution
  end
end
