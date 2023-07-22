# config/routes.rb
Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes
  devise_for :users

  resources :rooms, only: [:new, :index, :show, :create, :edit, :update] do
    
    end
  end

