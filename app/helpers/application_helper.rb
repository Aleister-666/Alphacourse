module ApplicationHelper
	include Pagy::Frontend

	def determine_courses_way
		return students_courses_path unless user_signed_in?
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
