class ApplicationController < ActionController::Base
	include Pagy::Backend
	
	before_action :configure_permitted_parameters, if: :devise_controller?

	helper ComponentsHelper

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) do |user_params|
			user_params.permit(:username, :email, :password, :password_confirmation)
		end
	end

	def after_sign_in_path_for(resource)
		helpers.determine_courses_way
	end

	def authenticate_admin!
		unless current_user.admin?
			redirect_to root_path, alert: 'Acceso Denegado'
		end
	end

	def lock_for_visible(course)
	  redirect_back_or_to students_courses_path, alert: 'Acceso Invalido' unless course.visible
	end

	def lock_for_inscription(course)
		unless current_user.course_inscript?(course)
			redirect_back_or_to students_courses_path, alert: 'Acceso Invalido: Tienes que estar inscrito en el curso para acceder a este recurso' 
		end
	end
end
