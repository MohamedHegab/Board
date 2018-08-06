FactoryBot.define do
  factory :user , class: 'User' do
    username { Faker::Name.name }
    email 'user@cariage.com'
    password 'password'
  end

  factory :admin , parent: :user ,class: 'Admin' do
    username { Faker::Name.name }
    email 'admin@cariage.com'
    password 'password'
  end

  factory :member , parent: :user ,class: 'Member' do
    username { Faker::Name.name }
    email 'member@cariage.com'
    password 'password'
  end

end