FactoryGirl.define do
  factory :favorite_user_link do
    favoriter_id { |predator| rand(1..999999) }
    favorited_id { |prey| rand(1..999999) }
  end
end