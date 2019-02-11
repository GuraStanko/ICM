Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  get "pages/about"
  get "pages/user"

  resources :posts do
  	member do
  		get :like
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
