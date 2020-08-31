Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :users, only: :create

      post 'authenticate', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
    end
  end
end
