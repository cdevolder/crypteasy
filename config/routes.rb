Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'

  get "/dashboard", to: "pages#dashboard"

  resources :cryptos, only: [:index, :show]

  resources :favorites do
    resources :alerts
  end

  resources :platforms, only: [:index, :show]

  resources :exchangetimevalues, only: [:show, :new, :create, :edit, :update]

  resources :offers, only: [:index, :show]

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end


end
