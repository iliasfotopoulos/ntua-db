DbProject::Application.routes.draw do
  get "upcoming_reservations/index"
  #get "reservations/index"
  #get "reservations/new"
  #get "reservations/edit"
  #get "reservations/show"
  #get "reservations/delete"
  #get "clients/index"
  #get "clients/show"
  #get "clients/new"
  #get "clients/edit"
  #get "clients/delete"
  #get "rooms/index"
  #get "rooms/show"
  #get "rooms/new"
  #get "rooms/edit"
  #get "rooms/delete"
  #get "hotels/index"
  #get "hotels/show"
  #get "hotels/new"
  #get "hotels/edit"
  #get "hotels/delete"

  root to: "hotels#index"

  resources :clients do
    resources :reservations do
      collection do
        post 'available_rooms'
      end
    end
  end

  resources :hotels do
    resources :rooms
  end

  #match ':controller(/:action(/:id))', :via => :get

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
