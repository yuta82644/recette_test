Rails.application.routes.draw do
  resources :recipes
  
  devise_for :users
  resources :rooms, only: [:new, :index, :show, :create, :edit, :update]
end