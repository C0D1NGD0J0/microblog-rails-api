Rails.application.routes.draw do
	
	scope "/api" do
		get "/current_user", to: "sessions#logged_in"
		post "/login", to: "sessions#create"
		post "/signup", to: "registrations#create", as: "signup"
		delete "/logout", to: "sessions#logout"
		resources :articles
	end

	root to: "static#home"
end
