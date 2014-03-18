# spec/models/weather_report_spec.rb

require 'spec_helper'

describe WeatherReport do

  it { should validate_presence_of(:temperature) }
  it { should validate_presence_of(:zip_code_id) }
  it { should validate_presence_of(:weather_condition_id) }

  it { should belong_to(:zip_code) }
  it { should belong_to(:weather_condition) }

end