module ZipCodesHelper

  def friendly_time_format(datetime)
    datetime.strftime("%-I:%M %p on %-m/%d/%Y")
  end


  def top_weather_condition_icon(zip_code)
    WeatherCondition.find(
      zip_code.array_of_frequencies_by_id.first.first
    ).icon
  end

  def array_to_javascript_array_string(array)
    array_with_apostrophes = array.map do |element|
      "'#{element}'"
    end

    "[#{array_with_apostrophes.join(", ")}]"
  end

end
