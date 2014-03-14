FactoryGirl.define do
  factory :user do
    name { |n| Faker::Name.name }
    password { |p| Faker::Internet.password }
  end
end