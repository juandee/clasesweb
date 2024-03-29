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
      patch :updatepupils
      patch :deletepupils
  		resources :tasks do
        resources :questions do
          resources :answers
          patch :answerquestion
        end
        patch :makequestion
      end
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#show"
end