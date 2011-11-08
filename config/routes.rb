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

  root :to => "pages#home", :as => "home_page"

  match '/leaderboards' => 'pages#leaderboards'
  match '/leaderboards/users' => 'pages#users', :as => :leaderboards_users_path
  match '/leaderboards/items' => 'pages#items', :as => :leaderboards_items_path
  get "pages/leaderboards"
  match '/items_admin/multiNew' => 'items#multiNew', :as => :items_multinew_path
  match '/items_admin/multi_create' => 'items#multi_create_scatter', :via => :post
  post '/items_admin/mn_specific' => 'items#multi_create_specific', :as => :mn_specific_path
  match '/items_admin/multiNewSpecific' => 'items#multi_new_specific', :as => :items_multinew_specific
  match '/signup' => 'users#new', :as => :signup_path
  match '/login' => 'sessions#new', :as => :login_path
  match '/logout' => 'sessions#destroy', :as => :logout_path
  match '/backpack' => 'items#backpack', :as => :backpack_path
  match '/itemDetails/:id' => 'item_histories#itemDetails'
  match '/admin' => 'pages#admin', :as => :admin_portal_path

  match '/demo/mapanimation/' => 'pages#mapanimation'
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

