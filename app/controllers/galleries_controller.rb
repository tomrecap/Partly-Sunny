class GalleriesController < ApplicationController

  def show
    # make this less repetitive
    if params[:city_id]
      @photos = City.find(city_id).photos
      @subject = :city
    elsif params[:user_id]
      @photos = City.find(city_id).photos
      @subject = :user
    elsif params[:tag_id]
      @photos = City.find(city_id).photos
      @subject = :tag
    end


  end

end
