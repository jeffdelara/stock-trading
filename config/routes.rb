Rails.application.routes.draw do
  
  root 'static_pages#home'
  devise_for :users
  
  namespace :admin do 
    get '/', to: 'users#index'
    resources :users 
    resources :pending_traders
  end
  
  resources :quotes, :except => [:show]
  get 'quotes/:symbol', to: 'quotes#show'
  get 'sell_stocks/:symbol', to: 'sell_stocks#show', as: 'get_sellstock'
  post 'sell_stocks/:symbol', to: 'sell_stocks#create', as: 'sell_stock'
  get 'portfolio', to: 'stocks#index'
  resources :stocks
end
