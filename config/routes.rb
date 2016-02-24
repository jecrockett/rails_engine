Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/find', to: 'merchants/find#show'
      get '/merchants/find_all', to: 'merchants/find#index'
      get '/merchants/random', to: 'merchants/random#show'
      get '/merchants/:id/items', to: 'merchants/items#index'
      get '/merchants/:id/invoices', to: 'merchants/invoices#index'
      resources :merchants, only: [:index, :show]
    end
  end
end
