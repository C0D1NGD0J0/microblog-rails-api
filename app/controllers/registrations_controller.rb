class RegistrationsController < ApplicationController
	skip_before_action :authorize
	
	def create
		user = User.new(user_params)
		user.password_confirmation = params[:password]

		if user.save
			session[:user_id] = user.id
			render json: { status: :created, user: user }
		else
			render json: { status: 500, errors: { msg: "Oops! something went wrong, please try again." } }
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password)
		end
end