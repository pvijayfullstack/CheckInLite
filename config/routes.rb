CheckInLite::Application.routes.draw do

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
resources :users
resources :sessions

get "sessions/new"

resources :users do
	resources :locations
end
	root :to => 'users#index'
end
