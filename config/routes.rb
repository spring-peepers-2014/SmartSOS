SmartSOS::Application.routes.draw do

	root :to => 'campaigns#show_all'
	resources :organizations do
		resources :campaigns
			resources :requests, except: [:show, :edit, :new]
	end

	resources :donors, except: [:index]

	# REQUEST ROUTES
	get '/organizations/:organization_id/campaigns/:id/make_requests' => 'requests#make_requests', as: :make_requests
	get '/organizations/:organization_id/campaigns/:id/edit_requests' => 'requests#edit_requests', as: :edit_requests


	# SESSION ROUTES
	get '/sessions/login/organizations' => 'sessions#organizations_new', as: :organizations_login
	post '/sessions/create/organizations' => 'sessions#organizations_create'

	get '/sessions/login/donors' => 'sessions#donors_new', as: :donors_login
	post '/sessions/create/donors' => 'sessions#donors_create'

	get '/sessions/logout' => 'sessions#logout'

end
