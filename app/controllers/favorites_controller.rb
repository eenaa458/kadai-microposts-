class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    puts params
    @micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(@micropost)
    flash[:success] = 'マイクロポストをいいねしました。'
    redirect_to root_url
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(@micropost)
    flash[:success] = 'マイクロポストのいいねを解除しました。'
    redirect_to root_url
  end
end