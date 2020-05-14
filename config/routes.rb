Rails.application.routes.draw do
  get 'pages/about', 'pages#about'
  devise_for :users
  root to: 'pages#home'
  resources :articles
  resources :contacts, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
