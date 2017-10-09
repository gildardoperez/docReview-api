Rails.application.routes.draw do
  resources :doctors do
  	collection do
		get :recent
		get :active
		get :unanswered
	end
    resources :reviews
  end  

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
