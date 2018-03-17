Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update, :index]
  resources :themes, only: [:new, :create, :index, :show] do
    resources :posts, only: [:index, :new, :create, :update, :show, :edit]
    resources :inscriptions, only: [:new, :create, :index, :show, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
