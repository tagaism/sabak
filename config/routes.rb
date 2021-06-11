Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :courses
  resources :users, only: :index
  root 'home#index'
end
