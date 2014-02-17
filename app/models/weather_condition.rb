# == Schema Information
#
# Table name: weather_conditions
#
#  id          :integer          not null, primary key
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class WeatherCondition < ActiveRecord::Base
  attr_accessible :description

  validates :description, presence: true, uniqueness: true

  has_many(
    :weather_reports,
    class_name: "WeatherReport",
    foreign_key: :weather_condition_id,
    primary_key: :id
  )

end
