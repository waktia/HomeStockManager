class MainCategoriesController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :edit, :create]
  before_action :correct_user, only: [:index, :new ]
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_main_category, only: [:edit, :update, :destroy]


  def index
    @main_categories = @user.main_categories.all

  end

  def new
    @main_category = @user.main_categories.build
  end

  def create
    @main_category = @user.main_categories.build(main_category_params)
    if @main_category.save
      redirect_to user_main_categories_path(@user)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @main_category.update(main_category_params)
      flash[:success] = "カテゴリー編集完了"
      redirect_to user_main_categories_path(@user)
    else
      render "edit", status: :unprocessable_entity
    end
  end


  def destroy
    if @user.items.find_by(main_category_id: @main_category.id).nil?
      @main_category.destroy
      flash[:success] = "カテゴリーを削除しました"
      if request.referrer.nil?
        redirect_to user_main_categories_path(@user), status: :see_other
      else
        redirect_to request.referrer, status: :see_other
      end
    else
      flash[:danger] = "管理アイテムにカテゴリーが含まれているので、削除できません。アイテムのカテゴリーを外してください"
      redirect_to user_main_categories_path(@user), status: :see_other
    end
  end



  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_main_category
    @main_category = MainCategory.find(params[:id])
    @user =current_user
  end

  def main_category_params
    params.require(:main_category).permit(:name)
  end

  def correct_user
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      flash[:danger] = "ユーザーが見つかりません"
      redirect_to(root_url)
    elsif @user != current_user
      flash[:danger] = "アクセス権限がありません"
      redirect_to(root_url)
    end
  end
end
