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
    #データを受け取る（ページごと）
    @post_images = PostImage.page(params[:page])
  end

  def show
    # 詳細画面
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    #データを受け取る（一件）
    post_image = PostImage.find(params[:id])
    #データを削除
    post_image.destroy
    # showへリダイレクト
    redirect_to post_image_path
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

    # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
