CheckInLite::Application.routes.draw do
	resources :users do
		resources :locations
	end
	root :to => 'users#index'
end
