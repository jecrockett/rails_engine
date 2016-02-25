Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/favorite_customer', to: 'favorite_customers#show'
        get '/:id/customers_with_pending_invoices', to: 'pending_invoices#show'
        get '/:id/revenue', to: 'revenues#show'
        get '/revenue', to: 'revenues#index'
      end
      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/favorite_merchant', to: 'favorite_merchants#show'
      end

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/merchant', to: 'merchants#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
      end
      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/transactions', to: 'transactions#index'
        get ':id/invoice_items', to: 'invoice_items#index'
        get ':id/items', to: 'items#index'
        get ':id/customer', to: 'customers#show'
        get ':id/merchant', to: 'merchants#show'
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/invoice', to: 'invoices#show'
        get '/:id/item', to: 'items#show'
      end

      namespace :transactions do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/invoice', to: 'invoices#show'
      end


      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
