class StaticPagesController < ApplicationController
  def home
     #@micropost = current_user.microposts.build if logged_in?
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = Micropost.page(params[:page]) 
    end
  end
end
