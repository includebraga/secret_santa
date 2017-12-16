FactoryBot.define do
  factory :match do
    user
    receiver

    received false
    email_sent true
  end
end
