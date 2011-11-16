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

  match '/leaderboards/users' => 'pages#top_drops_by_user', :as => :leaderboards_users_path
  match '/leaderboards/items' => 'pages#top_hops_by_item', :as => :leaderboards_items_path
  match '/leaderboards/distance' => 'pages#running_distance_by_item', :as => :leaderboards_distance_path
  match '/items_admin/multiNew' => 'items#multi_new_random', :as => :items_multinew_path
  match '/items_admin/multi_create' => 'items#multi_create_scatter', :via => :post
  post '/items_admin/mn_specific' => 'items#multi_create_specific', :as => :mn_specific_path
  match '/items_admin/multiNewSpecific' => 'items#multi_new_specific', :as => :items_multinew_specific
  match '/items_admin/master_map' => 'items#master_map', :as => :master_map_path
  match '/signup' => 'users#new', :as => :signup_path
  match '/login' => 'sessions#new', :as => :login_path
  match '/logout' => 'sessions#destroy', :as => :logout_path
  match '/backpack' => 'items#backpack', :as => :backpack_path
  match '/itemDetails/:id' => 'item_histories#itemDetails'
  match '/admin' => 'pages#admin', :as => :admin_portal_path

  match '/demo/mapanimation' => 'pages#map_animation'
  match '/demo/canvasmap' => 'pages#canvas_map'
  match '/api/allHistory' => 'item_histories#mapHistory', :format => 'json'
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
  match '/api/loginToSite' => 'sessions#create_by_app'

end

