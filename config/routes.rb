Rails.application.routes.draw do

  resources :players do
    collection do
      get 'position_search'
      get 'location_search'
    end
  end

  resources :stats
  resources :player_stats

  root "home#index"

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"

  resources :accounts, only: [:new, :create, :update] do
    resources :notifications
  end
  resources :position_needs, only: [:create, :destroy]

  resources :schools, only: [:index, :show, :new, :create] do
    collection do
      get 'position_needs_search'
      get 'location_search'
    end
  end

  resources :favorite_schools, only: [:create, :destroy]
  
  resources :sessions, only: [:new, :create, :destroy]

  resources :home, only: :index

  # match "/panda/authorize_upload" => "panda#authorize_upload", via: [:get, :post, :put, :patch]
  resources :videos
  # match "/panda/authorize_upload_postprocess", :to => "panda#authorize_upload_postprocess", via: [:get, :post, :put, :patch]
  # get "/new_video", :to => "videos#simple"
  # match "/videos/postprocess", :to => "videos#postprocess", via: [:get, :post, :put, :patch]

  post "/panda/authorize_upload", :to => "panda#authorize_upload"
  post "/panda/authorize_upload_postprocess", :to => "panda#authorize_upload_postprocess"
  get "/new_video", :to => "videos#simple"
  get "/new_video/advanced", :to => "videos#advanced"
  post "/videos/postprocess", :to => "videos#postprocess"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
