Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'

  resources :cryptos, only: [:index, :show]

  resources :favorites

  resources :platforms, only: [:index, :show]

  resources :exchangetimevalues, only: [:show, :new, :create, :edit, :update]

end
