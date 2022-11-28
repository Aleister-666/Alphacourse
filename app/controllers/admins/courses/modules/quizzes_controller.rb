class Admins::Courses::Modules::QuizzesController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!
	before_action :set_section, only: %i[ new create ]
	before_action :set_quiz, except: %i[ new create ]

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
			if @quiz.update(pages_params)
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

	private

	def set_section
		@section = Section.find(params[:section_id])
	end

	def set_quiz
		@quiz = ModuleQuiz.find(params[:id])
	end

	def quizzes_params
    params.require(:module_quiz).permit(:title, :description)
  end
end
