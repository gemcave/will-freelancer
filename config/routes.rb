Rails.application.routes.draw do
	
	
	root 'pages#home'
	
	get '/dashboard', to: 'users#dashboard'
	get '/users/:id', to: 'users#show'
	post '/users/edit', to: 'users#update'
	get '/selling_orders', to: 'orders#selling_orders'
	get '/buying_orders', to: 'orders#buying_orders'
	get '/all_requests', to: 'requests#list'

	put '/orders/:id/complete', to: 'orders#complete', as: 'complete_order'

	
	resources :gigs do 
		member do
			delete :delete_photo
			post :upload_photo
		end
		resources :orders, only: [:create]
	end

	resources :requests

	devise_for :users,
							path: '',
							path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
							controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

end
