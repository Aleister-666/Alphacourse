class Admins::Courses::Modules::QuizzesController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!
	before_action :set_section, only: %i[ new create ]
	before_action :set_quiz, except: %i[ new create ]
	before_action :lock_for_attempts, only: %i[ edit update ]

	layout 'workstation'

	def new
		@quiz = @section.module_quizzes.build
	end

	def create
		@quiz = @section.module_quizzes.build(quizzes_params)
		@quiz.course_module = CourseModule.new(course_id: @section.course_id, section_id: @section.id)

		respond_to do |format|
			if @quiz.save
				format.html { redirect_to admins_courses_modules_quiz_path(@quiz), notice: 'Modulo Cuestionario: Creado' }				
			else
				format.html { render :new, status: :unprocessable_entity }
			end
		end
	end

	def show
	end

	def edit
	end

	def update
		respond_to do |format|
			if @quiz.update(quizzes_params)
				format.html {
					redirect_to admins_course_path(@quiz.course_module.course_id), notice: 'Modulo Cuestionario: Actualizado'
				}
			else
				format.html {
					render :edit, status: :unprocessable_entity
				}
			end
		end
	end

	def destroy
		@quiz.destroy

		respond_to do |format|
			format.html {
				redirect_to admins_course_path(@quiz.course_module.course_id), notice: 'Modulo Cuestionario: Eliminado'
			}
		end
	end

	def delete_attempts
		attempts = QuizAttempt.where(module_quiz: @quiz)
		completations = CourseModuleCompletation.where(course_module: @quiz.course_module)

		respond_to do |format|

			unless attempts.empty?
				attempts.destroy_all
				completations.destroy_all
				
				format.html { redirect_to admins_courses_modules_quiz_path(@quiz), alert: 'Intentos Eliminados' }
			end
		end
	end

	private

	def set_section
		@section = Section.find(params[:section_id])
	end

	def set_quiz
		@quiz = ModuleQuiz.find(params[:id])
	end

	def lock_for_attempts
		if @quiz.quiz_attempts.any?
			respond_to do |format|
				msg = "No puedes editar un cuestionario que ya ha sido respondido"
				format.turbo_stream {
					flash.now[:alert] = msg
					render turbo_stream: helpers.render_flash_messages
				}

				format.html { redirect_to admins_course_path(@quiz.course_id), alert: msg }
			end
			
		end
	end

	def quizzes_params
    params.require(:module_quiz).permit(:title, :description, :min_value, :value)
  end
end
