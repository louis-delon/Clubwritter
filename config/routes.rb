Rails.application.routes.draw do

  get 'categories/index'

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update] do
    resources :posts, only: [:index]
  end

  resources :themes do
    resources :posts, only: [:new, :create, :show, :edit, :destroy, :update]
    collection do
      get 'pending'
      get 'ended'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
