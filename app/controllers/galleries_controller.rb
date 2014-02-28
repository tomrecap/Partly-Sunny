class GalleriesController < ApplicationController
  before_filter :require_signed_in!
  before_filter :clear_redirect

  def show
    # @zip_codes = ZipCode.all

    # use includes(:photos)?
    if params[:zip_code_id]
      @subject = ZipCode.includes(:photos).find(params[:zip_code_id])
      @name = @subject.zip_code
    elsif params[:user_id]
      @subject = User.includes(:photos).find(params[:user_id])
      @name = @subject.user_name
    elsif params[:tag_id]
      @subject = Tag.includes(:photos).find(params[:tag_id])
      @name = @subject.body
    end

    if @subject.is_a?(ZipCode)
      @photos = @subject.nearby_photos
      .page(params[:page]).per(10).order("created_at DESC")
    else
    @photos = @subject.photos
      .page(params[:page]).per(10).order("created_at DESC")
    end
  end

end
