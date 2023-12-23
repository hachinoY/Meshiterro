class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    #編集画面へ移動
    @user = User.find(params[:id])
  end

  def update
    #データを受け取る（一件）
    @user = User.find(params[:id])
    # 投稿一覧画面へリダイレクト
    @user.update(user_params)
    #show画面へリダイレクト
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
