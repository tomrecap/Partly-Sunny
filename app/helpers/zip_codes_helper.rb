module ZipCodesHelper

  def friendly_time_format(datetime)
    datetime.strftime("%-I:%M %p on %-m/%d/%Y")
  end


  def top_weather_condition_icon(zip_code)
    WeatherCondition.find(
      zip_code.array_of_frequencies_by_id.first.first
    ).icon
  end

end
