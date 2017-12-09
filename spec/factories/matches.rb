FactoryBot.define do
  factory :match do
    user
    receiver

    email_sent true
  end
end
