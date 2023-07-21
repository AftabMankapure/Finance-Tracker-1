# Rails.application.routes.draw do
#   devise_for :users
#   resources :user_stocks, only: [:create]
#   root 'welcome#index'
#   get 'my_portfolio', to: 'users#my_portfolio'
#   get 'search_stock', to: 'stocks#search'

# end

Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only: [:create ]# Add index and show actions
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'user_stocks', to: 'user_stocks#create'
end
