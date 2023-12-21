class PostImagesController < ApplicationController

  def new
    # データを新しく登録する
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    #データを受け取り新規登録するためのインスタンス作成
    @post_image = PostImage.new(post_image_params)
    # 投稿データに、今ログイン中のユーザーの ID を持たせることができる
    @post_image.user_id = current_user.id
    #データをデータベースに保存するためのsaveメソッド実行
    @post_image.save
    # post_images_pathを描画する
    redirect_to post_images_path
  end

  def index
    #データを受け取る（全て）
    @post_images = PostImage.all
  end

  def show
    # 詳細画面
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_image_path
  end

    # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
