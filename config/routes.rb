Rails.application.routes.draw do
  devise_for :users
  # top が / の表示になる
  root to: 'homes#top'
  get '/homes/about' => 'homes#about' , as: 'about'
  # rubyが勝手にroutesを作ってくれる
  # resources :
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
