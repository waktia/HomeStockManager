class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :show]
  before_action :correct_user,   only: [ :show, :edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @items= @user.items
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールを確認して、本登録を完了してください"
      redirect_to root_url
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィール 編集完了"
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find_by(id: params[:id])
      if @user.nil?
        flash[:danger] = "ユーザーが見つかりません"
        redirect_to(root_url)
      elsif @user != current_user
        flash[:danger] = "アクセス権限がありません"
        redirect_to(root_url)
      end
    end
end
