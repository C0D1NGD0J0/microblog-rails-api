class SessionsController < ApplicationController
	skip_before_action :authorize
	include CurrentUserConcern

	def create
		user = User.find_by(email: params['email']).try(:authenticate, params['password'])
		if user
			session[:user_id] = user.id
			render json: {
				status: :created,
				isLoggedIn: true,
				user: user
			}
		else
			render json: { status: 401 }
		end
	end

	def logged_in
		if @current_user
			render json: {
				isLoggedIn: true,
				user: @current_user
			}
		else
			render json: {
				isLoggedIn: false
			}
		end
	end

	def logout
		reset_session
		render json: { status: 200, isLoggedIn: false }
	end
end