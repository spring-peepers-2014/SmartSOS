SmartSOS::Application.routes.draw do
	root :to => 'application#homepage'

	get '/aboutus' => 'application#aboutus'

	get '/campaigns' => 'campaigns#show_all', as: :campaigns

	resources :organizations, except: [:index] do
		resources :campaigns, except: [:index] do
			resources :requests, except: [:show, :edit, :new]
		end
	end

	resources :donors, except: [:index, :show]

	# DASHBOARD ROUTE
	get '/organizations/:id/dashboard' => 'organizations#dashboard', as: :show_dashboard

	# REQUEST ROUTES
	get '/organizations/:organization_id/campaigns/:campaign_id/make_requests' => 'requests#make_requests', as: :make_requests
	get '/organizations/:organization_id/campaigns/:campaign_id/edit_requests' => 'requests#edit_requests', as: :edit_requests


	# PLEDGE ROUTES
	get '/donor/:donor_id/pledges' => 'pledges#list_donor_pledges', as: :donor_pledges
	post '/organizations/:organization_id/campaigns/:campaign_id/create_pledges' => 'pledges#create_pledges', as: :create_pledges

	# SESSION ROUTES
	get '/sessions/login/organizations' => 'sessions#organizations_new', as: :organizations_login
	post '/sessions/create/organizations' => 'sessions#organizations_create'

	get '/sessions/login/donors' => 'sessions#donors_new', as: :donors_login
	post '/sessions/create/donors' => 'sessions#donors_create'

	get '/sessions/logout' => 'sessions#logout'

end
