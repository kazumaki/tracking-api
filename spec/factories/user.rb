FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'meme123' }
    password_confirmation { 'meme123' }
  end
end
