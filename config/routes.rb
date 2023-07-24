# config/routes.rb
Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes do
    collection do
      get :my_recipes
    end
  end

  devise_for :users

  resources :rooms, only: [:new, :index, :show, :create, :edit, :update]
end
