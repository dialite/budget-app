Rails.application.routes.draw do  devise_for :users

  resources :home, only: [:index]
  resources :group_expenses
  resources :expenses
  resources :groups
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
