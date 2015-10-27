Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  get    'edit_user_path'   => 'users#edit'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
    member do
     get 'followings'
     get 'followers'
   end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts #add L7.8.2
  resources :relationships, only: [:create, :destroy]  #add L7.9.4
end
