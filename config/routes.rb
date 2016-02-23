Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/find', to: 'merchants_find#show'
      get '/merchants/find_all', to: 'merchants_find#index'
      get '/merchants/random', to: 'merchants_random#show'
      get '/merchants/:id/items', to: 'merchant_items#index'
      resources :merchants, only: [:index, :show]
    end
  end
end
