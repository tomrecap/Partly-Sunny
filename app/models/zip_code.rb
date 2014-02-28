# == Schema Information
#
# Table name: zip_codes
#
#  id         :integer          not null, primary key
#  zip_code   :string(255)      not null
#  city       :string(255)      not null
#  state_name :string(255)      not null
#  state_code :string(255)      not null
#  longitude  :float            not null
#  latitude   :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ZipCode < ActiveRecord::Base
  attr_accessible :zip_code, :city, :state_name, :state_code,
    :longitude, :latitude

  validates :zip_code, :city, :state_name, :state_code,
    :longitude, :latitude, presence: true
  validates :zip_code, uniqueness: true

  has_many(:weather_reports, class_name: "WeatherReport",
    foreign_key: :zip_code_id, primary_key: :id)

  has_many(:weather_conditions, through: :weather_reports,
    source: :weather_condition)

  has_many(:residents, class_name: "User",
    foreign_key: :home_zip_code_id, primary_key: :id)

  has_many(:favorite_zip_code_links, class_name: "FavoriteZipCodeLink",
    foreign_key: :zip_code_id, primary_key: :id)

  has_many(:favoriters, through: :favorite_zip_code_links,
    source: :user)

  has_many(:photos, class_name: "Photo",
    foreign_key: :zip_code_id, primary_key: :id)

  include PgSearch
  pg_search_scope :search_by_zip_code, against: :zip_code
  pg_search_scope :search_by_city, against: :city


  # RE-DO FOR ZIP CODES

  # def self.find_with_current_data(city_id)
  #   City.includes(weather_reports: :weather_condition)
  #     .where("weather_reports.created_at >= ?", WeatherReport::TIME_HORIZON)
  #     .find(city_id)
  # end

  def nearby_zip_codes
    distance_range = 0.2
    min_longitude = self.longitude - distance_range
    max_longitude = self.longitude + distance_range
    min_latitude = self.latitude - distance_range
    max_latitude = self.latitude + distance_range

    ZipCode.includes(:weather_reports, :photos).where(
      "(latitude BETWEEN ? AND ?) AND (longitude BETWEEN ? AND ?)",
      min_latitude,
      max_latitude,
      min_longitude,
      max_longitude
    )
  end

  def nearby_weather_reports
    distance_range = 0.15
    min_longitude = self.longitude - distance_range
    max_longitude = self.longitude + distance_range
    min_latitude = self.latitude - distance_range
    max_latitude = self.latitude + distance_range

    WeatherReport.joins(:zip_code)
      .includes(:weather_condition)
      .where(
        "(zip_codes.latitude BETWEEN ? AND ?) AND (zip_codes.longitude BETWEEN ? AND ?)",
        min_latitude,
        max_latitude,
        min_longitude,
        max_longitude
      )
      .order("weather_reports.created_at DESC")
  end

  def top_three_conditions
    frequencies_by_name = {}
    self.array_of_frequencies_by_id[0...3].each do |id, frequency|
      name = self.condition_names_hash[id]
      frequencies_by_name[name] = frequency
    end

    frequencies_by_name
  end

  def array_of_frequencies_by_id
    condition_ids = nearby_weather_reports.map(&:weather_condition_id)
    frequencies_by_id = build_frequency_hash(condition_ids)
    hash_to_array_sorted_by_values(frequencies_by_id)
  end

  def build_frequency_hash(array)
    frequencies = Hash.new(0)
    array.each { |elem| frequencies[elem] += (100.0/array.length) }
    frequencies
  end

  def hash_to_array_sorted_by_values(hash)
    hash.sort_by { |key, value| -value }
  end

  def condition_names_hash
    unless @condition_names_hash
      @condition_names_hash = {}
      WeatherCondition.all.each do |condition|
        @condition_names_hash[condition.id] ||= condition.description
      end
    end

    @condition_names_hash
  end

# # use includes for city & city.joinsweatherreport here
#   def recent_reports
#     @recent_reports ||= self.weather_reports.includes(:weather_condition).where("city_id = ? AND created_at >= ?", self.id, WeatherReport::TIME_HORIZON).order("created_at DESC")
#   end

  def current_temperature(use_celsius = false)
    temperatures = nearby_weather_reports.map(&:temperature)
    return nil unless nearby_weather_reports.any?
    average = (temperatures.inject(&:+) / temperatures.length)

    use_celsius ? (convert_to_celsius(average).round(1)) : average.round(1)

  end

  def convert_to_celsius(fahrenheit)
    ((fahrenheit - 32) * 5 / 9.0)
  end


end
