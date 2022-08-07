Rails.application.routes.draw do
  devise_for :users
  root to:'fishings#index'
  resources :fishings do
    resource :favorites, only: [:create, :destroy]
  end

end
 