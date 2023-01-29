module CourseCompletation
	extend ActiveSupport::Concern

	included do


		# Setea como incompleto un curso para todos los usuarios que lo tengan completado
		# @return [CoursesUser]
		def set_incomplete_course_status
		  completations = CoursesUser.where('course_id = ? AND completed = ?', self.course_id, true)
		  
		  unless completations.nil?
		    completations.update_all(completed: false)
		  end
		end


		def set_complete_course_status
			imcompletations = CoursesUser.where('course_id = ? AND completed = ?', self.course_id, false).all

			users_to_completed = imcompletations.select { |e| e.user.course_progress(e.course) == 100 }.map { |e| e.id }

			unless users_to_completed.nil?
				CoursesUser.where(id: users_to_completed).update(completed: true)
			end

		end

	end





	class_methods do

	end
end