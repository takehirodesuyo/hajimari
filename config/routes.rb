Rails.application.routes.draw do
  get  'signup' => "users#new"
  root 'static_pages#home'
  get 'search' => 'static_pages#search'
  get 'home' => "static_pages#home"
  get 'help' => "static_pages#help"
  get 'about' => "static_pages#about"
  get 'contact' => "static_pages#contact"
  
  # ログイン機能実装
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # フォロー機能実装
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :tweets, only: [:create, :edit, :update, :destroy]
  
  resources :tweets do
    resource :likes, only: [:create, :destroy]
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
