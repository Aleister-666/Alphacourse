module ApplicationHelper

	def determine_courses_from_role
		if current_user.admin?
			admins_courses_path
		else
			students_courses_path
		end
	end


	def render_flash_messages
		turbo_stream.update 'flash', partial: 'shared/flash'
	end
end
