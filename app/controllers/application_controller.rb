class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	helper ComponentsHelper

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) do |user_params|
			user_params.permit(:username, :email, :password, :password_confirmation)
		end
	end

	def after_sign_in_path_for(resource)
		helpers.determine_courses_from_role
	end

	def authenticate_admin!
		unless current_user.admin?
			redirect_to root_path, alert: 'Acceso Denegado'
		end
	end
end
