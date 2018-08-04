FactoryBot.define do
  factory :member do
    username { Faker::Name.name }
    email 'user@cariage.com'
    password 'password'
  end
end