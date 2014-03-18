FactoryGirl.define do
  factory :photo_tagging do
    photo_id { |predator| rand(1..999999) }
    tag_id { |prey| rand(1..999999) }
  end
end