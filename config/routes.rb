Rails.application.routes.draw do
  get 'sessions/new'

  resources :tweets, only: [:create, :destroy]
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 		               'sessions#new'
  get    	'login'   => 	 'sessions#new'
  post   	'login'   => 	 'sessions#create'
  delete 	'logout'  => 	 'sessions#destroy'
  get		  'signup'  =>   'users#new'
  post		'signup'  =>   'users#create'
end
