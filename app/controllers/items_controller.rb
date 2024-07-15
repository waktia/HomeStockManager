class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :update, :destroy]
  before_action :set_user, only:[:index, :create, :edit, :update, :destroy]
  def index
    @feed_items = current_user.feed.order(main_category_id: :ASC)
    @item = current_user.items.build
  end

  def edit
    @item = current_user.items.find_by(id: params[:id])
  end


  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "在庫管理の登録が完了しました"
      redirect_to root_url
    else
      Rails.logger.info @item.errors.full_messages
      @feed_items = current_user.feed
      render "static_pages/home", status: :unprocessable_entity
    end
  end

  def update
    @item = current_user.items.find_by(id: params[:id])
    if @item.update(item_params)
      flash[:success] = "アイテム 編集完了"
      redirect_to user_items_path(@user)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @item = current_user.items.find_by(id: params[:id])
    @item.destroy
    flash[:success] = "管理物を削除しました"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :main_category_id, :stock, :days)
    end

    def set_user
      @user = current_user
    end


end
