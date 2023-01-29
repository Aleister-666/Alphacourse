module CoursesHelper

	# Actualiza el registro de completacion de un curso para todos
	# los usuarios que tengan un curso como completo
	# (Este metodo solo se llama cuando se crea un nuevo registro)
	# @return [Array]
	def update_all_completed_course_status(course_id)
		completations = CoursesUser.where('course_id = ? AND completed = ?', course_id, true)
	  
	  unless completations.nil?
	    completations.update_all(completed: false)
	  end
	end
end
