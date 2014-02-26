class WeatherReportsController < ApplicationController

  def new
    @weather_report = WeatherReport.new(zip_code_id: params[:zip_code_id])

    @weather_conditions = WeatherCondition.all
  end

  def create
    @weather_report = WeatherReport.new(params[:weather_report])
    @weather_report.zip_code_id = ZipCode.find_by_zip_code(
      params[:zip_code_for_weather_report]
    ).id

    if params[:temperature_scale] == "celsius"
      @weather_report.temperature = convert_to_fahrenheit(@weather_report.temperature)
    end

    if @weather_report.save
      redirect_to zip_code_url(@weather_report.zip_code_id)
    else
      flash.now[:errors] = @weather_report.errors.full_messages

      render :new
    end
  end

  def create_with_photo
    models = []

    if params[:photo][:image]
      @photo = current_user.photos.new(params[:photo])
      models << @photo
    end

    unless params[:weather_report][:temperature].empty?
      @weather_report = WeatherReport.new(params[:weather_report])

      if params[:temperature_scale] == "celsius"
        @weather_report.temperature = convert_to_fahrenheit(@weather_report.temperature)
      end

      models << @weather_report
    end

    if params[:zip_code_code]
      zip_code_id = ZipCode.find_by_zip_code(
        params[:zip_code_code]
      ).id
    end

    save_results = models.map do |model|
      model.zip_code_id = zip_code_id
      model.save
    end

    if save_results.all?
      @notice = "Weather report and photo posted successfully."

      if request.xhr?
        render json: @photo, status: 200
      else
        redirect_to photo_url(@photo) if models.first.is_a?(Photo)
        redirect_to zip_code_url(@weather_report.zip_code_id) if models.first.is_a?(WeatherReport)
      end
    else
      @errors = models.map(&:errors.full_messages)

      if request.xhr?
        render json: @errors, status: 200
      else
        render :new_with_photo
      end
    end
  end

end
