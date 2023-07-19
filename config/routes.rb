Rails.application.routes.draw do
  # get 'users/my_portflolio'
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portflolio'
end
