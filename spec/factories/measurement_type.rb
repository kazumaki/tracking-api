FactoryBot.define do
  factory :measurement_type do
    name { Faker::Name.name }
    unit { Faker::Name.name }
  end
end