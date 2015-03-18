Rails.application.routes.draw do
  resources :users
  resources :pages
  resources :sessions

  delete 'sign_out' => 'sessions#destroy'

  root 'pages#index'
end
