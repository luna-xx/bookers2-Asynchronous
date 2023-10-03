Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  root :to => "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
    resources :favorites, only: [:create, :destroy]
    resources :book_commtents, only: [:create, :destroy]
  end
  
  resources :users, only: [:index,:show,:edit,:update]
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 end

