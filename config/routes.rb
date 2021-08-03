Rails.application.routes.draw do
  resources :posts do
    collection do
      post :confirm
    end
  end
  root 'sessions#new'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

end
