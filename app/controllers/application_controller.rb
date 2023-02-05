class ApplicationController < ActionController::Base
	include Pagy::Backend
	
	before_action :configure_permitted_parameters, if: :devise_controller?

	helper ComponentsHelper

	protected

	# Modifica los parametros permitidos por devise
	# y los agrega al procesamiento del modelo
	# @return [Nil]
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) do |user_params|
			user_params.permit(:username, :email, :password, :password_confirmation)
		end

		devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end

	# Modifica el comportamiento de los controladores de devisa
	# al iniciar session. Envia al usuario a la pagina de cursos
	# correspondiente segun su rol
	# @param resource [ActionController::Base]
	def after_sign_in_path_for(resource)
		helpers.determine_courses_way
	end

	# Verifica que el usuario actualmente logeado sea un administrador
	# De no serlo, se le prohibe el acceso y es redirigido
	# a la pagina anterior o al root
	# @return [Nil]
	def authenticate_admin!
		redirect_back_or_to root_path, alert: 'Acceso Denegado' unless current_user.admin?
	end

	# Prohibe el acceso al usuario, si el curso al cual corresponde
	# la ruta del recurso no es un curso visible
	# @param course [Course]
	# @return [Nil]
	def lock_for_visible(course)
	  redirect_back_or_to students_courses_path, alert: 'Acceso Invalido' unless course.visible
	end

	# Prohibe el acceso al usuario, si el curso al cual corresponde
	# la ruta del recurso, no tiene inscrito al usuario actual.
	# Si el usuario no esta inscrito, su acceso es denegado
	# @param course [Course]
	# @return Nil
	def lock_for_inscription(course)
		unless current_user.course_inscript?(course)
			redirect_back_or_to students_courses_path, alert: 'Acceso Invalido: Tienes que estar inscrito en el curso para acceder a este recurso' 
		end
	end
end
