# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AVATAR_URLS = ["http://mphprogramslist.com/files/2012/10/Julio_Frenk.jpeg"]

# AVATAR_URLS = ["http://mypolice.qld.gov.au/wp-content/uploads/2013/01/Missing-Person-Herston-image1.jpg", "https://pbs.twimg.com/profile_images/2204913930/IMG_1486-PersonOnly-Twitter.jpg", "http://b-i.forbesimg.com/bruceupbin/files/2013/03/Chris.jpg", "http://www.primelog.com/Files/Billeder/COM/Media/unitedlog_spokes-person_lena-ridstrom_download.jpg.jpg"]

WEATHER_PHOTO_URLS = ["http://www.sgi.com/solutions/research/images/weather.jpg"]

# WEATHER_PHOTO_URLS = ["http://3.bp.blogspot.com/_f9Ap9E7Lv-I/TU5PmTBi8PI/AAAAAAAAAAo/IPBxud5X48I/s1600/severe-weather-weather-250417_1600_1200.jpg", "http://fc06.deviantart.net/fs17/f/2007/173/7/8/Before_the_storm_by_pestilence.jpg", "http://androidheadlines.com/wp-content/uploads/2012/05/48-1024x670.jpg", "http://www.sinodegmit.org/wp-content/uploads/2013/09/2.jpg", "http://www.ei.lehigh.edu/envirosci/weather/weather_image.jpg", "http://www.bbna.com/website/weather.jpg", "http://riddlenationaz.erau.edu/files/2014/01/fair-weather-clouds-1-1q4hr82.jpg", "http://www.brandeis.edu/about/images/newformat/visiting-weather.jpg", "http://www.visitscotland.com/cms-images/2x1/travel-weather/weather/weather-winter", "http://tahira007.files.wordpress.com/2012/12/scotland-202_2.jpg", "http://www.fife.50megs.com/Tour%20Glenshee%20Winter%20Scotland/images/Tour%20Glenshee%20Winter%20Scotland%20028_jpg.jpg", "http://www.visitdunkeld.com/Winter%20Crannog%20Scotland/images/Winter%20Crannog%20Scotland%2008_jpg.jpg", "http://1.bp.blogspot.com/_gNmRzZ4aXzo/TPDYwyol7sI/AAAAAAAAAnY/vfUaCGSKmro/s640/PB250260.JPG", "http://script-meteolive.leonardo.it/admin/immaginiNotizie/SRC/__058935___img1.jpg", "http://2.bp.blogspot.com/_4DzLbV79i7g/TQzv1tU1ISI/AAAAAAAAmEk/EpY5zPLCKUI/s1600/Tour%2BScotland%2BWinter%2BPhotograph%2BHighland%2BCow.jpg", "http://2.bp.blogspot.com/_4DzLbV79i7g/TQzv1tU1ISI/AAAAAAAAmEk/EpY5zPLCKUI/s1600/Tour%2BScotland%2BWinter%2BPhotograph%2BHighland%2BCow.jpg", "http://2.bp.blogspot.com/_4DzLbV79i7g/TQzv1tU1ISI/AAAAAAAAmEk/EpY5zPLCKUI/s1600/Tour%2BScotland%2BWinter%2BPhotograph%2BHighland%2BCow.jpg", "http://2.bp.blogspot.com/_4DzLbV79i7g/TQzv1tU1ISI/AAAAAAAAmEk/EpY5zPLCKUI/s1600/Tour%2BScotland%2BWinter%2BPhotograph%2BHighland%2BCow.jpg"]

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
#

WeatherCondition.find(1).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/windy.png")
WeatherCondition.find(2).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/rainy.png")
WeatherCondition.find(3).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/sunny.png")
WeatherCondition.find(4).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/cloudy.png")
WeatherCondition.find(5).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/hot.png")
WeatherCondition.find(6).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/cold.png")
WeatherCondition.find(7).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/snowing.png")
#
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
#     avatar: AVATAR_URLS.sample
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
#       image: WEATHER_PHOTO_URLS.sample,
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

# # randomize weather report times
#
# WeatherReport.all.each do |weather_report|
#   random_time_in_last_day = Time.now - rand(0...(24*60*60))
#   weather_report.created_at = random_time_in_last_day
#   weather_report.save!
# end
#
# # randomize pictures times
#
# Photo.all.each do |photo|
#   random_time_in_last_day = Time.now - rand(0...(24*60*60))
#   photo.created_at = random_time_in_last_day
#   photo.save!
# end