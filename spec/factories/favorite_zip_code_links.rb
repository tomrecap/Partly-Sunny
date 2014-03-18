FactoryGirl.define do
  factory :favorite_zip_code_link do
    zip_code_id { |predator| rand(1..999999) }
    user_id { |prey| rand(1..999999) }
  end
end