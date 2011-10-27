Ipro369MoJo::Application.routes.draw do

  get "pages/leaderboards"


  match '/items/multiNew' => 'items#multiNew', :as => :items_multinew_path
  match '/items/multi_create' => 'items#multi_create', :via => :post
  resources :item_descriptions

  resources :item_histories
  resources :items
  resources :images
  resources :bagtypes
  resources :users
  resources :locations
  resources :interactions
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => "sessions#new", :as => "home_page"

  match '/leaderboards' => 'pages#leaderboards'
  match '/leaderboards/users' => 'pages#users', :as => :leaderboards_users_path
  match '/leaderboards/items' => 'pages#items', :as => :leaderboards_items_path

  match '/signup' => 'users#new', :as => :signup_path
  match '/login' => 'sessions#new', :as => :login_path
  match '/logout' => 'sessions#destroy', :as => :logout_path

    match '/backpack' => 'items#backpack', :as => :backpack_path
  match '/itemDetails/:id' => 'item_histories#itemDetails'

  ### API Methods ###
  match '/api/pickupItem' => 'items#pickup', :format => 'json'
  match '/api/dropItem' => 'items#drop', :format => 'json'
  match '/api/getItemDetails/:id' => 'item_histories#itemDetails', :format => 'json'
  match '/api/getItemDetails' => 'item_histories#itemDetails', :format => 'json'
  match '/api/getBackpackItems' => 'items#backpack', :format => 'json'
  match '/api/getItemsNearBy' => 'items#nearby', :format => 'json'
  match '/api/recordLocation' => 'locations#record_location', :format => 'json'
  match '/api/getImage' => 'images#getImage', :format => 'json'
  match '/api/locationPing/:latitude/:longitude/:timestamp' => 'locations#record_location', :format => 'json'
  match '/api/registerUser' => 'users#create', :format => 'json'
  match '/api/login' => 'sessions#create', :as => 'api_login', :format => 'json'
  match '/api/logout' => 'sessions#destroy', :as => 'api_logout', :format => 'json'
  match '/api/getLocationsForRange' => 'locations#get_locations_for_range', :format => 'json'
  match '/api/getLocationsForRangeInArea' => 'locations#get_locations_for_range_in_area', :format => 'json'
  match '/api/writeInteraction' => 'interactions#create', :format => 'json'
  match '/api/getItemDescription' => 'item_descriptions#show', :format => 'json'
  match '/api/getDescriptionUpdates' => 'item_descriptions#get_description_updates', :format => 'json'

end

