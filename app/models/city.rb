# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ActiveRecord::Base
  attr_accessible :name

  validates :name, uniqueness: true, presence: true

  has_many(
    :weather_reports,
    class_name: "WeatherReport",
    foreign_key: :city_id,
    primary_key: :id
  )

  has_many(
    :residents,
    class_name: "User",
    foreign_key: :home_city_id,
    primary_key: :id
  )

  has_many(
    :favorite_city_links,
    class_name: "FavoriteCityLink",
    foreign_key: :city_id,
    primary_key: :id
  )

  has_many(
    :favoriters,
    through: :favorite_city_links,
    source: :user
  )

# TO DO: clean this up
  def top_three_conditions
    condition_ids = recent_reports.map(&:weather_condition_id)
    total_reports = condition_ids.length

    frequencies_by_id = Hash.new(0)
    condition_ids.each { |id| frequencies_by_id[id] += (100.0/total_reports) }

    frequency_array = frequencies_by_id.sort_by do |_id, value|
      -value
    end

    frequencies_by_name = {}
    frequency_array[0...3].each do |id, frequency|
      frequencies_by_name[WeatherCondition.find(id).description] = frequency
    end

    frequencies_by_name
  end

  def recent_reports
    @recent_reports ||= WeatherReport.where("city_id = ? AND created_at >= ?", self.id, WeatherReport::TIME_HORIZON)
  end

  def current_temperature
    temperatures = recent_reports.map(&:temperature)
    average = (temperatures.inject(&:+) / temperatures.length)
    average.round(1)
  end

end
