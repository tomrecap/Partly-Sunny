class GalleriesController < ApplicationController
  before_filter :require_signed_in!

  def show
    @cities = City.all

    # use includes(:photos)?
    if params[:city_id]
      @subject = City.find(params[:city_id])
      @name = @subject.name
    elsif params[:user_id]
      @subject = User.find(params[:user_id])
      @name = @subject.user_name
    elsif params[:tag_id]
      @subject = Tag.find(params[:tag_id])
      @name = @subject.body
    end

    @photos = @subject.photos
      .page(params[:page]).per(10).order("created_at DESC")
  end

end
