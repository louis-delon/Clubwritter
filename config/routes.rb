Rails.application.routes.draw do

  get 'categories/new'

  get 'categories/create'

  get 'categories/update'

  get 'categories/destroy'

  get 'comments/index'

  get 'comments/create'

  get 'categories/index'

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update] do
    resources :posts, only: [:index]
  end

  resources :themes do
    resources :posts, only: [:new, :create, :show, :edit, :destroy, :update]
    collection do
      get 'ended'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
