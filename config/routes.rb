Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  resources :users, only: [:show, :edit, :update]

  root to: "homes#top"
  get "homes/about"=>"homes#about"

  resources :posts, only: [:index,:show,:edit,:create,:destroy,:update,:new]do
    resources :post_comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update]do
    resource :relationships, only: [:create,:destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :genres

  get "search" => "searches#search"
  get "search_result" => "searches#search_result"

end
