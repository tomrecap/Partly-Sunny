class WeatherReportsController < ApplicationController

  def new
    @weather_report = WeatherReport.new(zip_code_id: params[:zip_code_id])

    @weather_conditions = WeatherCondition.all
    @zip_codes = ZipCode.all
  end

  def create
    @weather_report = WeatherReport.new(params[:weather_report])

    if params[:temperature_scale] == "celsius"
      @weather_report.temperature = convert_to_fahrenheit(@weather_report.temperature)
    end

    if @weather_report.save
      redirect_to zip_code_url(@weather_report.zip_code_id)
    else
      flash.now[:errors] << @weather_report.errors.full_messages

      render :new
    end

  end

end
