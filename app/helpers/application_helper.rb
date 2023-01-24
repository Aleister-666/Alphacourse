module ApplicationHelper
	include Pagy::Frontend

	# Metodo que determina hacia que pagina de cursos
	# debe ir un usuario en funcion de su rol
	# @return [RailsRedirect]
	def determine_courses_way
		return students_courses_path unless user_signed_in?
		if current_user.admin?
			admins_courses_path
		else
			students_courses_path
		end
	end


	# Metodo que actualiza el valor de los mensajes flash
	# @return NilCLass
	def render_flash_messages
		turbo_stream.update 'flash', partial: 'shared/flash'
	end
end
