Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/merchants/find', to: 'merchants/find#show'
      get '/merchants/find_all', to: 'merchants/find#index'
      get '/merchants/random', to: 'merchants/random#show'
      get '/merchants/:id/items', to: 'merchants/items#index'
      get '/merchants/:id/invoices', to: 'merchants/invoices#index'
      resources :merchants, only: [:index, :show]

      get '/customers/find', to: 'customers/find#show'
      get '/customers/find_all', to: 'customers/find#index'
      get '/customers/random', to: 'customers/random#show'
      get '/customers/:id/invoices', to: 'customers/invoices#index'
      get '/customers/:id/transactions', to: 'customers/transactions#index'
      resources :customers, only: [:index, :show]

      get '/items/find', to: 'items/find#show'
      get '/items/find_all', to: 'items/find#index'
      get '/items/random', to: 'items/random#show'
      get '/items/:id/merchant', to: 'items/merchants#show'
      get '/items/:id/invoice_items', to: 'items/invoice_items#index'
      resources :items, only: [:index, :show]

      get '/invoices/find', to: 'invoices/find#show'
      get '/invoices/find_all', to: 'invoices/find#index'
      get '/invoices/random', to: 'invoices/random#show'
      get '/invoices/:id/transactions', to: 'invoices/transactions#index'
      get 'invoices/:id/invoice_items', to: 'invoices/invoice_items#index'
      get 'invoices/:id/items', to: 'invoices/items#index'
      get 'invoices/:id/customer', to: 'invoices/customers#show'
      get 'invoices/:id/merchant', to: 'invoices/merchants#show'
      resources :invoices, only: [:index, :show]


      resources :invoice_items, only: [:index, :show]
    end
  end
end
