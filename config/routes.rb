Rails.application.routes.draw do

  get 'post_images/new'
  get 'post_images/index'
  get 'post_images/show'
  get 'post_images/edit'
  # top が / の表示に変化する
  root to: 'homes#top'
  devise_for :users

  # ルーティングを一括して自動生成してくれる
  resources :post_images, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
