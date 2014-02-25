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

# create zip codes
# File.foreach("vendor/assets/us_zips.txt") do |zip_entry|
#   zip_details = zip_entry.split("  ")
#
#   zip_code = zip_details[1].to_i
#   city_name = zip_details[2]
#   state_name = zip_details[3]
#   state_code = zip_details[4]
#   latitude = zip_details[8].to_f
#   longitude = zip_details[9].to_f
#
#   ZipCode.create(
#     zip_code: zip_code,
#     city: city_name,
#     state_name: state_name,
#     state_code: state_code,
#     longitude: longitude,
#     latitude: latitude
#   )
# end

NYC_ZIP_CODES = [7010, 7020, 7022, 7024, 7026, 7031, 7057, 7070, 7071, 7072, 7073, 7074, 7075, 7603, 7604, 7605, 7606, 7608, 7643, 7644, 7650, 7657, 7660, 7002, 7030, 7047, 7087, 7093, 7094, 7096, 7097, 7099, 7302, 7303, 7304, 7305, 7306, 7307, 7308, 7309, 7310, 7311, 7399, 7014, 7055, 7086, 7390, 7395, 7699, 10451, 10452, 10453, 10454, 10455, 10456, 10457, 10458, 10459, 10460, 10461, 10462, 10463, 10467, 10468, 10469, 10472, 10473, 10474, 10499, 11201, 11202, 11203, 11204, 11205, 11206, 11207, 11208, 11209, 11210, 11211, 11212, 11213, 11214, 11215, 11216, 11217, 11218, 11219, 11220, 11221, 11222, 11223, 11225, 11226, 11228, 11229, 11230, 11231, 11232, 11233, 11234, 11235, 11236, 11237, 11238, 11239, 11240, 11241, 11242, 11243, 11244, 11245, 11247, 11248, 11249, 11251, 11252, 11254, 11255, 11256, 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10008, 10009, 10010, 10011, 10012, 10013, 10014, 10015, 10016, 10017, 10018, 10019, 10020, 10021, 10022, 10023, 10024, 10025, 10026, 10027, 10028, 10029, 10030, 10031, 10032, 10033, 10034, 10035, 10036, 10037, 10038, 10039, 10040, 10041, 10043, 10044, 10045, 10046, 10047, 10048, 10055, 10060, 10065, 10069, 10072, 10079, 10080, 10081, 10082, 10087, 10090, 10094, 10095, 10096, 10098, 10099, 10101, 10102, 10103, 10104, 10105, 10106, 10107, 10108, 10109, 10110, 10111, 10112, 10113, 10114, 10115, 10116, 10117, 10118, 10119, 10120, 10121, 10122, 10123, 10124, 10125, 10126, 10128, 10129, 10130, 10131, 10132, 10133, 10138, 10149, 10150, 10151, 10152, 10153, 10154, 10155, 10156, 10157, 10158, 10159, 10160, 10161, 10162, 10163, 10164, 10165, 10166, 10167, 10168, 10169, 10170, 10171, 10172, 10173, 10174, 10175, 10176, 10177, 10178, 10179, 10184, 10185, 10196, 10197, 10199, 10203, 10211, 10212, 10213, 10242, 10249, 10256, 10257, 10258, 10259, 10260, 10261, 10265, 10268, 10269, 10270, 10271, 10272, 10273, 10274, 10275, 10276, 10277, 10278, 10279, 10280, 10281, 10282, 10285, 10286, 10292, 11101, 11102, 11103, 11104, 11105, 11106, 11109, 11120, 11352, 11353, 11356, 11368, 11369, 11370, 11371, 11372, 11373, 11374, 11375, 11377, 11378, 11379, 11380, 11381, 11385, 11386, 11388, 11390, 11405, 11414, 11416, 11417, 11421, 11424, 11425, 11431, 11451, 11484, 11499, 11690, 11695, 11696, 10301, 10302, 10304, 10305, 10310, 10075, 10400]

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
#
# WeatherCondition.find(1).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/windy.png")
# WeatherCondition.find(2).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/rainy.png")
# WeatherCondition.find(3).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/sunny.png")
# WeatherCondition.find(4).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/cloudy.png")
# WeatherCondition.find(5).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/hot.png")
# WeatherCondition.find(6).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/cold.png")
# WeatherCondition.find(7).update_attributes!(icon: "https://s3-us-west-2.amazonaws.com/weather-app-dev/icons-stash/snowing.png")
#
# Tag.create(body: "windy")
# Tag.create(body: "rainy")
# Tag.create(body: "sunny")
# Tag.create(body: "cloudy")
# Tag.create(body: "hot")
# Tag.create(body: "cold")
# Tag.create(body: "snowing")

500.times do |i|
  fake_zip_code_id = ZipCode.find_by_zip_code(NYC_ZIP_CODES.sample).id
  fake_temperature = rand(15..45)
  fake_weather_condition_id = [1, 2, 3, 4, 6, 7].sample

  WeatherReport.create(
    temperature: fake_temperature,
    zip_code_id: fake_zip_code_id,
    weather_condition_id: fake_weather_condition_id
  )
end

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
#
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
#
# 25.times do
#   fake_temperature = rand(0..20) + 55
#   WeatherReport.create!(city_id: 2, temperature: fake_temperature, weather_condition_id: 3)
# end