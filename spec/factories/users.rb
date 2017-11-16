FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    confirmed_at { Time.now }
  end

  factory :user_with_confirmation_token, class: User do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    confirmation_token { |n| n }
  end
end
