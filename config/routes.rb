Rails.application.routes.draw do

  get 'groups/new'

  get 'groups/create'

  get 'groups/edit'

  get 'groups/update'

  get 'themes/new'

  get 'themes/create'

  get 'posts/index'

  get 'posts/new'

  get 'posts/create'

  get 'posts/show'

  get 'posts/edit'

  get 'posts/update'

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]

  resources :posts do
    resources :groups
    resources :themes, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
