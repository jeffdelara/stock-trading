Rails.application.routes.draw do
  
  resources :user_stock_portfolios, only: [:create]
  
  # get 'users/portfolio'
  root 'static_pages#home'
  devise_for :users

  # routing for portfolio
  get 'portfolio', to: 'users#portfolio'

  # routing for stocks
  get 'search_stock', to: 'stocks#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
