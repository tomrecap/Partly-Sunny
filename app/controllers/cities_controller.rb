class CitiesController < ApplicationController
  before_filter :require_signed_in!, except: [:show, :index, :search]

  def index
    redirect_to dashboard_user_url(current_user) if signed_in?
    @zip_codes = City.includes(:photos).all
    @weather_conditions = WeatherCondition.all

    @recently_updated_zip_codes = City.includes(:weather_reports).order("weather_reports.created_at DESC").uniq.limit(2)

    @recent_photos = @zip_codes.sample(2).map { |city| city.photos.first }

    render :index, layout: "public_index" unless signed_in?
  end

  def show
    @zip_codes = City.all
    @city = City.find_with_current_data(params[:id])
    # @city = City.find(params[:id])
    @current_temperature = @city.current_temperature(current_user.try(:celsius))

    @recent_reports = @city.recent_reports
    @recent_reports.map do |report|
      report.temperature = convert_to_celsius(report.temperature)
    end if current_user.try(:celsius)

    @weather_condition_frequencies = @city.top_three_conditions

    @photos = @city.photos.limit(2).order("created_at DESC")
  end

  def search
    @search_results = City.search_by_name(params[:search_query])

    if @search_results.count == 1
      redirect_to city_url(@search_results.first)
    else
      @search_query = params[:search_query]

      @zip_codes = City.all
      render :search
    end
  end

end
