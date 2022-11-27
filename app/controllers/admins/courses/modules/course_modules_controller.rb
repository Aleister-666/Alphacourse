class Admins::Courses::Modules::CourseModulesController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!
	before_action :set_course_module


	def move
		@course_module.insert_at(params[:position].to_i)
		head :ok
	end

	def destroy
		@course_module.destroy

		respond_to do |format|
			format.html { redirect_to admins_course_path(@course_module.course_id), alert: 'Modulo Eliminado' }
			format.turbo_stream { flash.now[:alert] = 'Modulo Eliminado' }
		end
	end

	private

	def set_course_module
		@course_module = CourseModule.find(params[:id])
	end
end
