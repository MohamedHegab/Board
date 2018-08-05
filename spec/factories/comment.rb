FactoryBot.define do
  factory :comment do
    body { Faker::Company.bs }
  end
end