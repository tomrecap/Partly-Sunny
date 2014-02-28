class FavoriteZipCodeLinksController < ApplicationController
  before_filter :require_signed_in!
  before_filter :clear_redirect

  def create
    @favorite_zip_code_link = current_user.favorite_zip_code_links.new
    @favorite_zip_code_link.zip_code_id = params[:zip_code_id]

    if @favorite_zip_code_link.save
      if request.xhr?
        render json: @favorite_zip_code_link, status: 200
      else
        redirect_to zip_code_url(@favorite_zip_code_link.zip_code_id)
      end
    else
      if request.xhr?
        render json: "failed to build favorite link", status: 422
      else
        flash[:errors] = @favorite_zip_code_link.errors.full_messages

        redirect_to :back
      end
    end
  end

  def destroy
    @favorite_zip_code_link = FavoriteZipCodeLink.find(params[:id])

    if @favorite_zip_code_link.user_id == current_user.id
      @favorite_zip_code_link.destroy

      flash[:notice] = "Favorite removed"
      redirect_to :back
    else
      flash[:notice] = "Cannot modify another user's favorite"
      redirect_to :back
    end
  end

  def modify
    @favorite_zip_code_link = FavoriteZipCodeLink
      .find_or_create_by_user_id_and_zip_code_id(
        current_user.id,
        params[:zip_code_id]
      )

    if request.post? && @favorite_zip_code_link.save
      render json: @favorite_zip_code_link, status: 200
    elsif request.delete? && @favorite_zip_code_link.destroy
      render json: "destroyed", status: 200
    else
      render json: "not found", status: 422
    end
  end

end
