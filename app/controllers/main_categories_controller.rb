class MainCategoriesController < ApplicationController
  before_action :set_user

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
    @main_category = @user.main_category.find(params[:main_gategory_id])
  end


  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def main_category_params
    params.require(:main_category).permit(:name)
  end
end
