# == Schema Information
#
# Table name: weather_reports
#
#  id                   :integer          not null, primary key
#  temperature          :integer          not null
#  weather_condition_id :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  zip_code_id          :integer
#

class WeatherReport < ActiveRecord::Base
  attr_accessible :temperature, :zip_code_id, :weather_condition_id

  validates :temperature, :zip_code_id, :weather_condition_id,
    presence: true

  belongs_to :zip_code
  belongs_to :weather_condition

  TIME_HORIZON = 14.days.ago

  def self.recent_reports(city_id)
    WeatherReport.where("created_at >= ? AND zip_code_id = ?", TIME_HORIZON, zip_code_id)
  end

end
