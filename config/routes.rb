Rails.application.routes.draw do
  resources :users, only: :create

  post 'authenticate', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
