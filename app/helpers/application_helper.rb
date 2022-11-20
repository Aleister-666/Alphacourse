module ApplicationHelper

	def determine_courses_from_role
		if current_user.admin?
			admins_courses_path
		else
			students_courses_path
		end
	end
end
