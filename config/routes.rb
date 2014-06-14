SmartSOS::Application.routes.draw do
	
	root :to => 'campaigns#show_all'
	resources :organizations do 
		resources :campaigns
	end

	resources :donors, except: :index 

	get '/organizations/login' => 'sessions#organizations_new', as: :organizations_login  
	post '/organizations/create' => 'sessions#organizations_create'  
	delete'/organizations/destroy' => 'sessions#organizations_destroy'  

	get '/donors/login' => 'sessions#donors_new', as: :donors_login  
	post '/donors/create' => 'sessions#donors_create'  
	delete '/donors/destroy' => 'sessions#donors_destroy'  
	
end
