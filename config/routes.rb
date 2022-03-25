Rails.application.routes.draw do
  
  root 'static_pages#home'
  devise_for :users
  
  namespace :admin do 
    get '/', to: 'users#index'
    resources :users 
    resources :pending_traders
    resources :transactions 
  end
  
  resources :quotes, :except => [:show]
  get 'quotes/:symbol', to: 'quotes#show'
  get 'portfolio', to: 'stocks#index'
  resources :stocks
end
