# spec/models/weather_condition_spec.rb

require 'spec_helper'

describe WeatherCondition do

  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:description) }

  it { should have_attached_file(:icon) }
  it { should have_many(:weather_reports) }

end