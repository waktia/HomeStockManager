class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @item = current_user.items.build
      @feed_items = current_user.items.weekly_limit.order(main_category_id: :ASC)
      @user = User.find(current_user.id)
    end
  end


  def help
    @user = User.find(current_user.id)
  end
end
