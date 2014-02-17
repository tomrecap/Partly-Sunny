class CitiesController < ApplicationController

  def index

  end

  def show
    @city = City.find(params[:id])
    @current_temperature = @city.current_temperature
    @recent_reports = @city.recent_reports
    @weather_condition_frequencies = @city.top_three_conditions

    @new_report_for_city_url = new_weather_report_url + "?city_id=#{params[:id]}"
  end

end
