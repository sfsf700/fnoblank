Rails.application.routes.draw do
  devise_for :users
  root to:'fishings#index'
  resources :fishings, only: [:index, :new, :create, :show, :edit, :update, :destroy]

end
