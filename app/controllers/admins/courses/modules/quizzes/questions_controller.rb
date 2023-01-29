class Admins::Courses::Modules::Quizzes::QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!
	before_action :set_quiz, only: %i[ new create ]
	before_action :set_question, except: %i[ new create ]
	before_action :lock_modify, except: %i[ move ]

	layout 'workstation'

	def new
		case params[:type]
		when 'multichoice'
			@question = @quiz.quiz_questions.build

			4.times { @question.question_answers.build }
		when 'truefalse'
			@question = @quiz.quiz_questions.build(question_type: 'truefalse')

			@question.question_answers.build(answer: 'Verdadero')
			@question.question_answers.build(answer: 'Falso')
		end

	end

	def create
		@question = @quiz.quiz_questions.build(questions_params)
		respond_to do |format|

			if @question.save
				format.html {
					redirect_to admins_courses_modules_quiz_path(@quiz), notice: 'Pregunta de Cuestionario: Creada'
				}
			else
				format.html { render :new, status: :unprocessable_entity }
			end
			
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @question.update(questions_params)
				format.html {
					redirect_to admins_courses_modules_quiz_path(@question.module_quiz_id), notice: 'Pregunta de Cuestionario: Actualizada'
				}
			else
				format.html {
					render :edit, status: :unprocessable_entity
				}
			end
		end
	end

	def destroy
		@question.destroy

		respond_to do |format|
			format.html {
				redirect_to admins_courses_modules_quiz_path(@question.module_quiz_id), alert: 'Pregunta de Cuestionario: Eliminada'
			}
		end
	end


	def move
		@question.insert_at(params[:position].to_i)
		head :ok
	end


	private

	def set_quiz
		@quiz = ModuleQuiz.find(params[:quiz_id])
	end

	def set_question
		@question = QuizQuestion.includes(question_answers: [:rich_text_answer, :rich_text_feedback])
			.where(id: params[:id]).first
	end

	def questions_params
		params.require(:quiz_question).permit(
			:title,
			:description,
			:score,
			:question_type,
			question_answers_attributes: [:id, :answer, :feedback, :fraction]
		)
	end

	def lock_modify
		if @quiz.nil?
			redirect_to admins_courses_modules_quiz_path(@question.module_quiz),
			 alert: 'No puedes modificar un cuestionario que ya ha sido respondido' if @question.module_quiz.quiz_attempts.any? 
			
		else
			redirect_to admins_courses_modules_quiz_path(@quiz),
			 alert: 'No puedes modificar un cuestionario que ya ha sido respondido' if @quiz.quiz_attempts.any?
		end
	end
end
