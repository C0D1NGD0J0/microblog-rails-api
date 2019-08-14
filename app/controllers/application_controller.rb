class ApplicationController < ActionController::Base
	include Pundit
	skip_before_action :verify_authenticity_token
	before_action :authorize

	protected
		def authorize
			unless User.find_by(id: session[:user_id])
				render json: { status: :unauthorized }
			end
		end
end
