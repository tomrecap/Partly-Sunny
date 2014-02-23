# == Schema Information
#
# Table name: weather_conditions
#
#  id                :integer          not null, primary key
#  description       :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#

class WeatherCondition < ActiveRecord::Base
  attr_accessible :description, :icon

  has_attached_file :icon, styles: { thumbnail: '100x100', full: '600x600' }
  validates :description, presence: true, uniqueness: true
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/

  has_many(
    :weather_reports,
    class_name: "WeatherReport",
    foreign_key: :weather_condition_id,
    primary_key: :id
  )

end
