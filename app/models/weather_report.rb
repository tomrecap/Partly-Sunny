# == Schema Information
#
# Table name: weather_reports
#
#  id                   :integer          not null, primary key
#  temperature          :integer          not null
#  city_id              :integer          not null
#  weather_condition_id :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class WeatherReport < ActiveRecord::Base
  attr_accessible :temperature, :city_id, :weather_condition_id

  validates :temperature, :city_id, :weather_condition_id, presence: true

  belongs_to(
    :city,
    class_name: "City",
    foreign_key: :city_id,
    primary_key: :id
  )

  belongs_to(
    :weather_condition,
    class_name: "WeatherCondition",
    foreign_key: :weather_condition_id,
    primary_key: :id
  )


  TIME_HORIZON = 14.days.ago

  def self.recent_reports(city_id)
    WeatherReport.where("created_at >= ? AND city_id = ?", TIME_HORIZON, city_id)
  end

end
