FactoryBot.define do
  factory :measurement do
    measurement_type
    value { Faker::Number.number(digits: 2) }
  end
end