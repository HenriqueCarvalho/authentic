Rails.application.routes.draw do
  resources :users, except: [:edit, :update, :destroy, :show]
  resources :pages, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]

  root 'pages#index'
end
