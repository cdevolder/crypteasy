Rails.application.routes.draw do
  get 'exchangetimevalues/show'

  get 'exchangetimevalues/new'

  get 'exchangetimevalues/create'

  get 'exchangetimevalues/edit'

  get 'exchangetimevalues/update'

  get 'platforms/index'

  get 'platforms/show'

  get 'favorites/index'

  get 'favorites/show'

  get 'favorites/new'

  get 'favorites/create'

  get 'favorites/edit'

  get 'favorites/update'

  get 'favorites/destroy'

  get 'cryptos/index'

  get 'cryptos/show'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
