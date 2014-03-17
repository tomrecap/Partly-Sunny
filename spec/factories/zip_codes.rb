FactoryGirl.define do
  factory :zip_code do
    zip_code { |z| rand(10000..99999).to_s }
    city { |c| "City" }
    state_name { |s| "State" }
    state_code { |s| "ST" }
    longitude { |l| -100 }
    latitude { |l| 100 }
  end
end