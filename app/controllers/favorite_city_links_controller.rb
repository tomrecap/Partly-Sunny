class FavoriteCityLinksController < ApplicationController
  before_filter :require_signed_in!

  def create
    @favorite_city_link = current_user.favorite_city_links.new
    @favorite_city_link.city_id = params[:favorite_city_link][:city_id]

    if @favorite_city_link.save
      redirect_to city_url(@favorite_city_link.city_id)
    else
      flash[:errors] = @favorite_city_link.errors.full_messages

      redirect_to :back
    end
  end

  def destroy
    @favorite_city_link = FavoriteCityLink.find(params[:id])

    if @favorite_city_link.user_id == current_user.id
      @favorite_city_link.destroy

      flash[:notice] = "Favorite removed"
      redirect_to :back
    else
      flash[:notice] = "Cannot modify another user's favorite"
      redirect_to :back
    end
  end


end
