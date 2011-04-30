CheckInLite::Application.routes.draw do

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
get "check_in/:location_id" => "locations#check_in", :as => "check_in"

#resources :users

get "sessions/new"

resources :sessions
resources :locatons

resources :users do
	resources :locations
end
	root :to => 'users#index'
end
