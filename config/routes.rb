Rails.application.routes.draw do
  # top が / の表示に変化する
  root to: 'homes#top'
  devise_for :users
  get 'about_path' => 'homes#about' ,as: 'about'

  # ルーティングを一括して自動生成してくれる
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end