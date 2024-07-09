class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @items = current_user.items
      @item = current_user.items.build
      @feed_items = current_user.feed
      @user = User.find(current_user.id)
    end
  end


  def help
    @user = User.find(current_user.id)
  end
end
