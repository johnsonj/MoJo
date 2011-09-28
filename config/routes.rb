Ipro369MoJo::Application.routes.draw do

  resources :item_histories
  resources :items
  resources :images
  resources :bagtypes
  resources :users
  resources :locations
  resources :interactions
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup' => 'users#new'
  match '/login' => 'sessions#new'
  match '/logout' => 'sessions#destroy'
  root :to => "sessions#new", :as => "home_page"

	match '/backpack' => 'items#backpack'
  match '/itemDetails/:id' => 'item_histories#itemDetails'

  ### API Methods ###
  match '/api/pickupItem' => 'items#pickup', :format => 'json'
  match '/api/dropItem' => 'items#drop', :format => 'json'
  match '/api/getItemDetails/:id' => 'item_histories#itemDetails', :format => 'json'
  match '/api/getItemDetails' => 'item_histories#itemDetails', :format => 'json'
  match '/api/getBackpackItems' => 'items#backpack', :format => 'json'
  match '/api/locationPing' => 'locations#ping', :format => 'json'
  match '/api/getImage' => 'images#show', :format => 'json'
  match '/api/locationPing/:latitude/:longitude/:timestamp' => 'locations#ping', :format => 'json'
  match '/api/login' => 'sessions#create', :as => 'api_login', :format => 'json'
  match '/api/logout' => 'sessions#destroy', :as => 'api_logout', :format => 'json'


  #dumb things

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
 ##   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
