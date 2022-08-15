Rails.application.routes.draw do
  devise_for :users
  root to:'fishings#index'
  resources :users, only: [:edit, :update]
  resources :fishings do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
  end

end
 