# == Schema Information
#
# Table name: weather_conditions
#
#  id          :integer          not null, primary key
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class WeatherConditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
