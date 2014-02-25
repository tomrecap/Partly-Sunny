class ZipCodesController < ApplicationController
  before_filter :require_signed_in!, except: [:show, :index, :search]

  def index
    redirect_to dashboard_user_url(current_user) if signed_in?
    @zip_codes = ZipCode.includes(:photos).all
    @weather_conditions = WeatherCondition.all

    @recently_updated_zip_codes = ZipCode.includes(:weather_reports).order("weather_reports.created_at DESC").uniq.limit(2)

    @recent_photos = @zip_codes.sample(2).map { |zip_code| zip_code.photos.first }

    render :index, layout: "public_index" unless signed_in?
  end

  def show
    @zip_codes = ZipCode.all
    @zip_code = ZipCode.find_with_current_data(params[:id])
    # @zip_code = ZipCode.find(params[:id])
    @current_temperature = @zip_code.current_temperature(current_user.try(:celsius))

    @recent_reports = @zip_code.recent_reports
    @recent_reports.map do |report|
      report.temperature = convert_to_celsius(report.temperature)
    end if current_user.try(:celsius)

    @weather_condition_frequencies = @zip_code.top_three_conditions

    @photos = @zip_code.photos.limit(2).order("created_at DESC")
  end

  def search
    @search_results = ZipCode.search_by_name(params[:search_query])

    if @search_results.count == 1
      redirect_to zip_code_url(@search_results.first)
    else
      @search_query = params[:search_query]

      @zip_codes = ZipCode.all
      render :search
    end
  end

end
