Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  # 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  root to: "homes#top"
  get "homes/about"=>"homes#about"

  resources :posts, only: [:index,:show,:edit,:create,:destroy,:update,:new]do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get "search_tag"=>"posts#search_tag"

  resources :users, only: [:index,:show,:edit,:update]do
    resource :relationships, only: [:create,:destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :favorites
    end
  end

  resources :genres

  get "search" => "searches#search"
  get "search_result" => "searches#search_result"

  get "rank" => "ranks#rank"

end
