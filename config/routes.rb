SmartSOS::Application.routes.draw do
	
	root :to => 'campaigns#show_all'
	resources :organizations do 
		resources :campaigns
	end

	resources :donors, except: :index 

	# SESSION ROUTES
	get '/sessions/login/organizations' => 'sessions#organizations_new', as: :organizations_login  
	post '/sessions/create/organizations' => 'sessions#organizations_create'  

	get '/sessions/login/donors' => 'sessions#donors_new', as: :donors_login  
	post '/sessions/create/donors' => 'sessions#donors_create'  

	get '/sessions/logout' => 'sessions#logout'  
	
end
