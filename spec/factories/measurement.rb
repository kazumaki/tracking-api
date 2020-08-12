FactoryBot.define do
  factory :measurement do
    measurement_type
    user
    value { Faker::Number.number(digits: 2) }
  end
end
