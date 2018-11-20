Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # api format : api/v1/...
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show, :update]
      resources :jets, only: [:index, :show, :create, :update, :destroy] do
        resources :reservations, only: [:create]
      end
      resources :reservations, only: [:show, :update, :destroy] do
        resources :reviews, only: [:create]
      end
    end
  end
end
