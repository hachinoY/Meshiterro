class PostImagesController < ApplicationController

  def new

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
  end

  def show
  end

    # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
