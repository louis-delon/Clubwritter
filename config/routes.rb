Rails.application.routes.draw do

  get 'categories/index'

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update, :index]
  resources :themes do
    resources :posts
    resources :inscriptions, only: [:new, :create, :index, :show, :destroy]
    collection do
      get 'pending'
      get 'ended'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
