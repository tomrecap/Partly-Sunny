module CitiesHelper

  def friendly_time_format(datetime)
    datetime.strftime("%-I:%M %p on %-m/%d/%Y")
  end


  def top_weather_condition_icon(city)
    WeatherCondition.find(
      city.array_of_frequencies_by_id.first.first
    ).icon
  end

end
