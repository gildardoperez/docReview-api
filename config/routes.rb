Rails.application.routes.draw do
  resources :doctors do
    resources :reviews
  end  

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
