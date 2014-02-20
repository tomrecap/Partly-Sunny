class GalleriesController < ApplicationController

  def show
    starting_photo = (params[:offset] || 0)

    # make this less repetitive
    if params[:city_id]
      @subject = City.find(params[:city_id])
      @photos = @subject.photos
        .limit(10).offset(starting_photo).order("created_at DESC")
      @name = @subject.name
    elsif params[:user_id]
      @subject = User.find(params[:user_id])
      @photos = @subject.photos
        .limit(10).offset(starting_photo).order("created_at DESC")
      @name = @subject.user_name
    elsif params[:tag_id]
      @subject = Tag.find(params[:tag_id])
      @photos = @subject.photos
        .limit(10).offset(starting_photo).order("created_at DESC")
      @name = @subject.body
    end


  end

end
