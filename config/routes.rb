Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  resources :tweets, only: [:create, :destroy]
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 		               'sessions#new'
  get    	'login'   => 	 'sessions#new'
  post   	'login'   => 	 'sessions#create'
  delete 	'logout'  => 	 'sessions#destroy'
  get		  'signup'  =>   'users#new'
  post		'signup'  =>   'users#create'
end
