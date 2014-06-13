SmartSOS::Application.routes.draw do
	resources :organizations do 
		resources :campaigns
	end
end
