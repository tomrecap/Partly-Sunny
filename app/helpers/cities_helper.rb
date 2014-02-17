module CitiesHelper

  def friendly_time_format(datetime)
    datetime.strftime("%-I:%M %p on %-m/%d/%Y")
  end

end
