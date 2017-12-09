FactoryBot.define do
  factory :institution do
    name { Faker::Company.name }
    short_name { ("A".."Z").to_a.sample(3).join }
  end
end
