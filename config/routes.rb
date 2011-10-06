Ipro369MoJo::Application.routes.draw do

  resources :item_descriptions

  resources :item_histories
  resources :items
  resources :images
  resources :bagtypes
  resources :users
  resources :locations
  resources :interactions
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup' => 'users#new', :as => :signup_path
  match '/login' => 'sessions#new', :as => :login_path
  match '/logout' => 'sessions#destroy', :as => :logout_path
  root :to => "sessions#new", :as => "home_page"

  match '/items/new' => 'items#multinew'
  match '/backpack' => 'items#backpack'
  match '/itemDetails/:id' => 'item_histories#itemDetails'

  ### API Methods ###
  match '/api/pickupItem' => 'items#pickup', :format => 'json'
  match '/api/dropItem' => 'items#drop', :format => 'json'
  match '/api/getItemDetails/:id' => 'item_histories#itemDetails', :format => 'json'
  match '/api/getItemDetails' => 'item_histories#itemDetails', :format => 'json'
  match '/api/getBackpackItems' => 'items#backpack', :format => 'json'
  match '/api/getItemsNearBy' => 'items#nearby', :format => 'json'
  match '/api/recordLocation' => 'locations#record_location', :format => 'json'
  match '/api/getImage' => 'images#show', :format => 'json'
  match '/api/locationPing/:latitude/:longitude/:timestamp' => 'locations#record_location', :format => 'json'
  match '/api/registerUser' => 'users#create', :format => 'json'
  match '/api/login' => 'sessions#create', :as => 'api_login', :format => 'json'
  match '/api/logout' => 'sessions#destroy', :as => 'api_logout', :format => 'json'

end

