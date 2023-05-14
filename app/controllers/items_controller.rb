class ItemsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # ユーザーの作成が成功した場合の処理
      redirect_to root_path
    else
      # ユーザーの作成が失敗した場合の処理
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end