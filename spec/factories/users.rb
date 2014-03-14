FactoryGirl.define do
  factory :user do
    user_name { |n| Faker::Name.name }
    password { |p| Faker::Internet.password }
  end
end