# == Schema Information
#
# Table name: zip_codes
#
#  id         :integer          not null, primary key
#  zip_code   :integer          not null
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

  has_many(:favorite_city_links, class_name: "FavoriteCityLink",
    foreign_key: :zip_code_id, primary_key: :id)

  has_many(:favoriters, through: :favorite_zip_code_links,
    source: :user)

  has_many(:photos, class_name: "Photo",
    foreign_key: :zip_code_id, primary_key: :id)

  include PgSearch
  pg_search_scope :search_by_zip_code, against: :zip_code


  # RE-DO FOR ZIP CODES

  # def self.find_with_current_data(city_id)
  #   City.includes(weather_reports: :weather_condition)
  #     .where("weather_reports.created_at >= ?", WeatherReport::TIME_HORIZON)
  #     .find(city_id)
  # end

  def nearby_zip_codes
    min_longitude = self.longitude - 0.1
    max_longitude = self.longitude + 0.1
    min_latitude = self.latitude - 0.1
    max_latitude = self.latitude + 0.1

    ZipCode.includes(:weather_reports).where(
      "(latitude BETWEEN ? AND ?) AND (longitude BETWEEN ? AND ?)",
      min_latitude,
      max_latitude,
      min_longitude,
      max_longitude
    )
  end

  def top_three_conditions
    frequencies_by_name = {}
    array_of_frequencies_by_id[0...3].each do |id, frequency|
      name = condition_names_hash[id]
      frequencies_by_name[name] = frequency
    end

    frequencies_by_name
  end

  def array_of_frequencies_by_id
    condition_ids = recent_reports.map(&:weather_condition_id)
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
    unless @conditions_names_hash
      @conditions_names_hash = {}
      weather_conditions.each do |condition|
        @conditions_names_hash[condition.id] ||= condition.description
      end
    end

    @conditions_names_hash
  end

# use includes for city & city.joinsweatherreport here
  def recent_reports
    @recent_reports ||= self.weather_reports.includes(:weather_condition).where("city_id = ? AND created_at >= ?", self.id, WeatherReport::TIME_HORIZON).order("created_at DESC")
  end

  def current_temperature(use_celsius = false)
    temperatures = recent_reports.map(&:temperature)
    average = (temperatures.inject(&:+) / temperatures.length)

    use_celsius ? (convert_to_celsius(average).round(1)) : average.round(1)

  end

  def convert_to_celsius(fahrenheit)
    ((fahrenheit - 32) * 5 / 9.0)
  end


end
