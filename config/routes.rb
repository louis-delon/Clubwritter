Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]
  resources :themes, only: [:new, :create] do
    resources :posts
    resources :inscriptions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
