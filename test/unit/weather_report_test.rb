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

require 'test_helper'

class WeatherReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
