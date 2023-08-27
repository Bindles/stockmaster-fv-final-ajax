Rails.application.routes.draw do
  get 'pages/index'
  get 'users/my_portfolio'
  get 'stocks/search'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'
  get 'mystocks', to: 'tstocks#mystocks'
  get 'home', to: 'pages#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'search', to: 'stocks#search'
end
 