FactoryBot.define do
  factory :measurement do
    user
    measurement_type
    value { Faker::Number.number(2) }
  end
end