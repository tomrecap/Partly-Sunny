class FavoriteCityLinksController < ApplicationController
  before_filter :require_signed_in!
  before_filter :prevent_users_from_modifying_others, only: :destroy

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
    FavoriteCityLink.destroy(params[:id])

    flash[:notice] = "Favorite removed"
    redirect_to :back
  end


end
