Rails.application.routes.draw do
  devise_for :users
  root to:'fishings#index'
  resources :fishings do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
  end

end
 