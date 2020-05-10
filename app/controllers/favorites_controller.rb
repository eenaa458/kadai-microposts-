class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.favorite(current_user)
    flash[:success] = 'ポストをいいねしました。'
    redirect_to root_url
  end

  def destroy
    @micropost = Favorite.find(params[:id].micropost)
    @micropost.unfavorite(current_user)
    flash[:success] = 'ポストのいいねを解除しました。'
    redirect_to root_url
  end
end
