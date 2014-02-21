# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# URLs = [
#   "https://pbs.twimg.com/profile_images/3773914077/18544b7b81ee722f45e5d44d52f00c72.jpeg", "https://pbs.twimg.com/profile_images/3340148147/2809347d0447e629c248f6a3a5bc4010.jpeg", "https://pbs.twimg.com/profile_images/3276050019/f1d244a9f3254f30176922985c761d28.png", "https://pbs.twimg.com/profile_images/3274461853/52263042d7ca94ca26b0685d89132ba2.jpeg", "https://pbs.twimg.com/profile_images/378800000606281941/0e7e643dd2ede2a9d00759baa6078846.jpeg", "https://pbs.twimg.com/profile_images/3230360564/d415b2f02a3deac94513be0165f195b8.jpeg", "http://www.interviewmagazine.com/files/2010/09/13/img-cat1_095138527099.jpg", "http://petslady.com/files/images/Cup_of_cat.img_assist_custom.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiY64UmGvMIJxyT7bvjj0FDiYXQjHKkjOJaxJ0PjlNO-qwbu3Y", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMz1AZoh5i94NwkoMBTX6EaSEPm-o8B_KPiAauqJDENHd-KMg-", "http://i34.tinypic.com/206c1p4.jpg", "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS_xBNW62Qtz_LX7pkPnHm3buF3okEpra10rT5P3SbnAIYbNupG", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp8TcMT1999afUvu0SRBH9IsQlPQNGOHESN8oxYqEh4esx1O0U", "http://t.fod4.com/t/6acca2c4bc/c480x270_28.jpg", "https://pbs.twimg.com/profile_images/2849194126/7740858f298648f2beb0fdc4da99a75c.png", "https://pbs.twimg.com/profile_images/3038657495/3d2f325c92060a35e7ac8c697c57d8d4.jpeg"
# ]
#
# City.create(name: "New York")
# City.create(name: "San Francisco")
# City.create(name: "Miami")
# City.create(name: "Boston")
# City.create(name: "Los Angeles")
# City.create(name: "Chicago")
#
# WeatherCondition.create(description: "Windy")
# WeatherCondition.create(description: "Rainy")
# WeatherCondition.create(description: "Sunny")
# WeatherCondition.create(description: "Cloudy")
# WeatherCondition.create(description: "Hot")
# WeatherCondition.create(description: "Cold")
# WeatherCondition.create(description: "Snowing")

WeatherCondition.find_by_description("Windy").icon = ActionController::Base.helpers.asset_path('images/icons/cloudy.png')
WeatherCondition.find_by_description("Rainy").icon = ActionController::Base.helpers.asset_path('images/icons/cold.png')
WeatherCondition.find_by_description("Sunny").icon = ActionController::Base.helpers.asset_path('images/icons/hot.png')
WeatherCondition.find_by_description("Cloudy").icon = ActionController::Base.helpers.asset_path('images/icons/rainy.png')
WeatherCondition.find_by_description("Hot").icon = ActionController::Base.helpers.asset_path('images/icons/snowing.png')
WeatherCondition.find_by_description("Cold").icon = ActionController::Base.helpers.asset_path('images/icons/sunny.png')
WeatherCondition.find_by_description("Snowing").icon = ActionController::Base.helpers.asset_path('images/icons/windy.png')

# Tag.create(body: "windy")
# Tag.create(body: "rainy")
# Tag.create(body: "sunny")
# Tag.create(body: "cloudy")
# Tag.create(body: "hot")
# Tag.create(body: "cold")
# Tag.create(body: "snowing")
#
# 500.times do |i|
#   fake_city_id = rand(1..6)
#   case fake_city_id
#   when 1, 4, 6
#     fake_temperature = rand(15..45)
#     fake_weather_condition_id = [1, 2, 3, 4, 6, 7].sample
#   when 2
#     fake_temperature = rand(40..70)
#     fake_weather_condition_id = [1, 2, 3, 4, 6].sample
#   when 3, 5
#     fake_temperature = rand(65..85)
#     fake_weather_condition_id = [1, 3, 4, 5].sample
#   end
#
#
#   WeatherReport.create(
#     temperature: fake_temperature,
#     city_id: fake_city_id,
#     weather_condition_id: fake_weather_condition_id
#   )
# end
#
# city_ids = [1, 2, 3, 4, 5, 6]
#
# 50.times do |user_number|
#   user = User.create(
#     user_name: Faker::Internet.user_name,
#     email: Faker::Internet.email,
#     password: "password",
#     bio: Faker::Lorem.paragraph[0...140],
#     home_city_id: rand(1..6),
#     avatar: URLs.sample
#   )
#
#   (1..6).to_a.shuffle.drop(3).each do |fav_city_id|
#     FavoriteCityLink.create(
#       user_id: user.id,
#       city_id: fav_city_id
#     )
#   end
#
#   if user_number > 11
#     fake_favorited_user_ids = (1...(user_number - 2)).to_a.shuffle.take(10)
#   else
#     fake_favorited_user_ids = []
#   end
#
#   fake_favorited_user_ids.each do |fav_user_id|
#       FavoriteUserLink.create(
#         favoriter_id: user.id,
#         favorited_id: fav_user_id
#       )
#   end
#
#   rand(0..5).times do |i|
#     Photo.create(
#       caption: Faker::Lorem.paragraph[0...140],
#       submitter_id: user.id,
#       city_id: user.home_city_id,
#       image: URLs.sample,
#       tag_ids: (1..7).to_a.shuffle.take(rand(1..5))
#     )
#   end
# end
#
# number_of_photos = Photo.all.count
# number_of_users = User.all.count
# 100.times do |comment_number|
#   Comment.create(
#     body: Faker::Lorem.paragraph[0...140],
#     photo_id: rand(1...number_of_photos),
#     user_id: rand(1...number_of_users)
#   )
# end