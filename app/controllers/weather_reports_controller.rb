class WeatherReportsController < ApplicationController

  def new
    @weather_report = WeatherReport.new(city_id: params[:city_id])

    @weather_conditions = WeatherCondition.all
    @cities = City.all
  end

  def create
    @weather_report = WeatherReport.new(params[:weather_report])

    if @weather_report.save
      redirect_to city_url(@weather_report.city_id)
    else
      flash.now[:errors] << @weather_report.errors.full_messages

      render :new
    end

  end

end
