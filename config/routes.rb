Rails.application.routes.draw do
  devise_for :users
  # top が / の表示に変化する
  root to: 'homes#top'
  get "homes/about" => "homes#about" ,as: "about"
  # ルーティングを一括して自動生成してくれる(post_image)
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  # ルーティングを一括して自動生成してくれる(post_comments)
  resources :post_comments, only: [:create]
  end
  # ルーティングを一括して自動生成してくれる(users)
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end