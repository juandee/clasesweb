Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	collection do
  		get :students
  	end
  	collection do
  		get :teachers
  	end
	  resources :courses do
      get :pupils
      get :addpupils
  		resources :tasks
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#show"
end