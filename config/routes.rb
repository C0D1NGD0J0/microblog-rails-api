Rails.application.routes.draw do
	
	scope "/api" do
		resources :login, only: [:create]
		get :logged_in, to: "sessions#logged_in"
		post "/signup", to: "registrations#create", as: "signup"
		delete "/logout", to: "sessions#logout"
	end

	root to: "static#home"
end
