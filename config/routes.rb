Rails.application.routes.draw do
  get 'home/index'
  get 'home/activities'
  devise_for :users
  resources :courses
  resources :lessons
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
end
