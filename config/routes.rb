Rails.application.routes.draw do
	resources :sessions, only: [:create]
	get :logged_in, to: "sessions#logged_in"
	post "/signup", to: "registrations#create", as: "signup"
	delete "/logout", to: "sessions#logout"
  root to: "static#home"
end
