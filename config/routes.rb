Rails.application.routes.draw do
  resource :users, only: :create

  post 'authenticate', to: 'sessions#create'
end
