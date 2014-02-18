class CitiesController < ApplicationController
  before_filter :require_signed_in!, except: [:show, :index]

  def index
    @cities = City.all
  end

  def show
    @city = City.find_with_current_data(params[:id])
    # @city = City.find(params[:id])
    @current_temperature = @city.current_temperature
    @recent_reports = @city.recent_reports
    @weather_condition_frequencies = @city.top_three_conditions

  end

end
