CheckInLite::Application.routes.draw do

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
get "check_in/:location_id" => "locations#check_in", :as => "check_in"
delete "delete_location/:location_id" => "locations#destroy", :as => "delete_location"
post "create_location" => "locations#create", :as => "create_location"

#resources :users

get "sessions/new"

#resources :users
resources :sessions
#resources :locatons

resources :users do
	resources :locations
end

root :to => 'users#index'
end
