Rails.application.routes.draw do
  resources :widgets
  post 'publish', to: 'widgets#publish'

  root to: 'home#index'
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :widgets, only: [:index, :show]
    end
  end

end
