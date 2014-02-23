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

require 'test_helper'

class WeatherConditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
