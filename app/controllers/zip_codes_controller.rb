class ZipCodesController < ApplicationController
  before_filter :require_signed_in!, except: [:show, :index, :search]

  def index
    redirect_to dashboard_user_url(current_user) if signed_in?
    @weather_conditions = WeatherCondition.all

    @recently_updated_zip_codes = [WeatherReport.last.zip_code]# ZipCode.includes(:weather_reports).order("weather_reports.created_at DESC").uniq.limit(2)

    @recent_photos = [] # = @zip_codes.sample(2).map do |zip_code|
 #      zip_code.photos.first if zip_code.photos
 #    end

    render :index, layout: "public_index" unless signed_in?
  end

  def show

    @zip_code = ZipCode.find(params[:id])
    @current_temperature = @zip_code.current_temperature(current_user.try(:celsius))

    @recent_reports = @zip_code.nearby_weather_reports
    @recent_reports.map do |report|
      report.temperature = convert_to_celsius(report.temperature)
    end if current_user.try(:celsius)

    @weather_condition_frequencies = @zip_code.top_three_conditions

    @photos = @zip_code.photos.limit(2).order("created_at DESC")

    # @photos = Photo.where
  end

  def search
    if params[:search_query][0] =~ /\d/
      @search_results = ZipCode
        .search_by_zip_code(params[:search_query])
    else
      @search_results = ZipCode
        .search_by_city(params[:search_query])
        .all
        .uniq { |zip| zip.city }
    end

    if @search_results.count == 1
      redirect_to zip_code_url(@search_results.first)
    else
      @search_query = params[:search_query]

      # @zip_codes = ZipCode.all
      render :search
    end
  end

end
