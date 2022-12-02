class Students::Courses::Modules::CourseModuleCompletionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_course_module

	def create
		@completation = current_user.course_module_completations.build(course_module: @course_module, complete: true)

		respond_to do |format|
			if @completation.save
				format.html { redirect_to students_course_path(@course_module.course_id), notice: 'Modulo Completado' }
				format.turbo_stream { flash.now[:notice] = 'Modulo Completado' }

			else
				format.html { redirect_to students_course_path(@course_module.course_id), alert: 'No se pudo completar el modulo' }
			end
		end
	end

	def update
		@completation = CourseModuleCompletation.find_by(course_module: @course_module, user: current_user)

		@complete = !@completation.complete
		msg = nil

		if @complete
			msg = { notice: "Modulo Completado" }
		else
			msg = { alert: "Modulo Des-Completado" }
		end

		respond_to do |format|
			if @completation.update(complete: @complete)
				format.html { redirect_to students_course_path(@course_module.course_id), msg}
				format.turbo_stream { flash.now[msg.keys.first] = msg[msg.keys.first] }
			else
				format.html { redirect_to students_course_path(@course_module.course_id), alert: "No se pudo procesar la solicitud"}
			end


		end
	end


	private

	def set_course_module
		@course_module = CourseModule.find(params[:course_module_id])
	end
end
