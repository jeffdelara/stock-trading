Rails.application.routes.draw do
  
  root 'static_pages#home'
  devise_for :users
  
  namespace :admin do 
    get '/', to: 'users#index'
    resources :users 
    resources :pending_traders
  end
  
  resources :quotes
  resources :stocks
end
