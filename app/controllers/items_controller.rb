class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "在庫管理の登録が完了しました"
      redirect_to root_url
    else
      @feed_items = current_user.feed
      render "static_pages/home", status: :unprocessable_entity
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
      params.require(:item).permit(:name, :stock, :days)
    end
end
