FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    confirmed_at { Time.now }
  end
end
