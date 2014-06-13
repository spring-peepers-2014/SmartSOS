SmartSOS::Application.routes.draw do
	
	root :to => 'campaigns#show_all'
	resources :organizations do 
		resources :campaigns
	end

	resources :donors, except: :index 
end
