FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email 'user@cariage.com'
    password 'password'
  end
end