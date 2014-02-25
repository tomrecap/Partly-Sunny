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

SAN_FRANCISCO_ZIP_CODES = [94607, 94608, 94615, 94617, 94625, 94626, 94701, 94702, 94703, 94706, 94707, 94710, 94530, 94925, 94941, 94965, 94102, 94103, 94104, 94105, 94107, 94108, 94109, 94110, 94111, 94112, 94114, 94115, 94116, 94117, 94118, 94121, 94122, 94123, 94124, 94127, 94129, 94130, 94131, 94132, 94133, 94134, 94143, 94005, 94014, 94015, 94080, 94013, 94158, 94199, 94616, 94650]

MIAMI_ZIP_CODES = [33010, 33012, 33013, 33014, 33016, 33054, 33101, 33110, 33119, 33122, 33125, 33126, 33127, 33128, 33129, 33130, 33131, 33132, 33133, 33134, 33135, 33136, 33137, 33138, 33139, 33140, 33141, 33142, 33144, 33145, 33147, 33149, 33150, 33151, 33152, 33153, 33154, 33155, 33158, 33161, 33162, 33165, 33166, 33167, 33168, 33181, 33195]

BOSTON_ZIP_CODES = [1432, 1460, 1464, 1470, 1471, 1472, 1474, 1701, 1702, 1703, 1704, 1705, 1718, 1719, 1720, 1731, 1741, 1742, 1749, 1752, 1754, 1773, 1775, 1776, 1778, 1784, 1805, 1806, 1807, 1808, 1813, 1815, 1822, 1824, 1853, 1865, 1866, 1886, 1888, 2153, 2156, 2160, 2161, 2164, 2165, 2168, 2173, 2175, 2177, 2178, 2179, 2193, 2195, 2212, 2238, 2239, 2254, 2258, 2272, 2277, 2456, 2471, 2475, 2477, 2479, 2495, 1451, 1740, 1434]

LOS_ANGELES_ZIP_CODES = [90001, 90002, 90003, 90004, 90005, 90006, 90007, 90008, 90010, 90011, 90012, 90013, 90014, 90015, 90016, 90017, 90018, 90019, 90020, 90021, 90022, 90023, 90026, 90027, 90028, 90029, 90031, 90032, 90033, 90035, 90036, 90037, 90038, 90039, 90040, 90042, 90043, 90044, 90045, 90047, 90048, 90056, 90057, 90058, 90059, 90061, 90062, 90065, 90068, 90069, 90201, 90211, 90220, 90221, 90222, 90232, 90240, 90241, 90242, 90247, 90248, 90249, 90254, 90255, 90260, 90262, 90270, 90277, 90278, 90280, 90301, 90302, 90303, 90305, 90501, 90502, 90503, 90504, 90640, 90706, 90712, 90713, 90714, 90723, 90746, 90747, 90805, 90807, 90808, 90846, 91030, 91108, 91754, 91801, 91803, 90189, 90895]

CHICAGO_ZIP_CODES = [60006, 60009, 60026, 60065, 60077, 60078, 60094, 60095, 60153, 60155, 60159, 60161, 60163, 60168, 60202, 60204, 60303, 60402, 60411, 60412, 60426, 60445, 60454, 60461, 60466, 60467, 60478, 60499, 60501, 60525, 60526, 60546, 60601, 60602, 60603, 60604, 60605, 60606, 60607, 60608, 60609, 60610, 60611, 60612, 60613, 60614, 60615, 60616, 60618, 60619, 60620, 60621, 60622, 60623, 60624, 60625, 60626, 60629, 60630, 60632, 60633, 60636, 60637, 60638, 60639, 60640, 60641, 60642, 60643, 60644, 60645, 60646, 60647, 60649, 60651, 60652, 60653, 60654, 60655, 60657, 60659, 60660, 60661, 60663, 60664, 60665, 60667, 60668, 60669, 60670, 60671, 60672, 60673, 60674, 60675, 60677, 60678, 60679, 60680, 60681, 60683, 60684, 60685, 60687, 60690, 60691, 60694, 60697, 60699, 60701, 60706, 60712, 60803, 60804, 60805, 60827, 60650, 60682, 60686, 60688, 60689, 60695, 60696]

GOOD_ZIP_CODES = NYC_ZIP_CODES + SAN_FRANCISCO_ZIP_CODES +
  MIAMI_ZIP_CODES + BOSTON_ZIP_CODES + LOS_ANGELES_ZIP_CODES +
  CHICAGO_ZIP_CODES

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
#
# # Make fake weather reports
#
# 1000.times do |i|
#   fake_zip_code_id = ZipCode.find_by_zip_code(GOOD_ZIP_CODES.sample).id
#   fake_temperature = rand(15..45)
#   fake_weather_condition_id = [1, 2, 3, 4, 6, 7].sample
#
#   WeatherReport.create(
#     temperature: fake_temperature,
#     zip_code_id: fake_zip_code_id,
#     weather_condition_id: fake_weather_condition_id
#   )
# end
#

User.all.each do |user|
  user.home_zip_code_id = ZipCode.find_by_zip_code(GOOD_ZIP_CODES.sample)
  user.save!
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