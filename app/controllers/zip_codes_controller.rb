class ZipCodesController < ApplicationController
  before_filter :require_signed_in!, except: [:show, :index, :search]
  before_filter :clear_redirect

  def index
    redirect_to dashboard_user_url(current_user) if signed_in?
    @weather_conditions = WeatherCondition.all

    # recent_cities = ZipCode
    #   .select("zip_codes.city")
    #   .joins(:weather_reports)
    #   .order("MAX(weather_reports.created_at) DESC")
    #   .limit(2)
    #   .group("zip_codes.id")
    #   .uniq
    #   .to_sql
    #   # .includes(:weather_reports)
    # zip_codes_from_recent_cities = ZipCode
    #   .where("zip_code.city IN (#{recent_cities})")
    #
    #   fail
    # @recently_updated_zip_codes = zip_codes_from_recent_cities.all.uniq { |zip_code| zip_code.city }


    @recently_updated_zip_codes = [
      ZipCode.find_by_city_and_state_code("New York City", "NY"),
      ZipCode.find_by_city_and_state_code("Chicago", "IL")
    ]

    @background_photo = Photo.limit(1).offset(rand(Photo.count)).first

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

    @photos = @zip_code.nearby_photos

    # @photos = Photo.where
  end

  def search
    if params[:search_query][0] =~ /\d/
      @zip_code_search_results = ZipCode
        .search_by_zip_code(params[:search_query])

      if @zip_code_search_results.count == 1
        redirect_to zip_code_url(@zip_code_search_results.first)
        return
      end
    else
      @zip_code_search_results = ZipCode
        .search_by_city(params[:search_query])
        .all
        .uniq { |zip| zip.city }
      @user_search_results = User
        .search_by_user_name(params[:search_query])
    end

    @search_query = params[:search_query]
    render :search
  end

end
