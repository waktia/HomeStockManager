class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @items = current_user.items
      @item = current_user.items.build
      @feed_items = current_user.feed
    end
  end


  def help
  end
end
