FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    confirmed_at { Time.now }
  end

  factory :user_with_confirmation_token, parent: :user do
    confirmation_token { |n| n }
  end

  factory :user_with_redeem_token, parent: :user do
    redeem_token { |n| n }
  end
end
