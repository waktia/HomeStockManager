class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @item = current_user.items.build

    if params[:filter]
      session[:filter] = params[:filter]
    end

      @filter = session[:filter] || "week"
      if @filter == "month"
        @feed_items = current_user.items.monthly_limit.order(main_category_id: :ASC)
      elsif @filter == "week"
        @feed_items = current_user.items.weekly_limit.order(main_category_id: :ASC)
      else
        session[:filter] = "week"
        redirect_to root_path

      end
      @user = User.find(current_user.id)
    end
  end


  def help
    if logged_in?
      @user = User.find(current_user.id)
    else
      flash[:danger] = "ログインしてください"
      redirect_to root_path
    end

  end


end
