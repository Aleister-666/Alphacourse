class Students::Courses::Quiz::AttemptsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz

  layout 'workstation'

  def start
    @questions = QuizQuestion.includes(:rich_text_description ,question_answers: :rich_text_answer)
      .where(module_quiz: @quiz)
  end

  def finish

    @quiz_attempt = QuizAttempt.new(module_quiz: @quiz, user: current_user)

    responses_params[:quiz_attempts_attributes].each do |key, value|
      @quiz_attempt.question_attempts.build(value)
    end

    respond_to do |format|
      if @quiz_attempt.save && @quiz_attempt.set_sum_scores

        format.html {
          redirect_to students_courses_quiz_results_attempt_path(@quiz, @quiz_attempt), notice: "Prueba Finalizada"
        }

      else
        format.html { render :start, status: :unprocessable_entity }
      end
    end
  end

  def results
    @quiz_attempt = QuizAttempt.includes(question_attempts: [:quiz_question, { question_answer: [:rich_text_answer, :rich_text_feedback] }])
    .where(id: params[:quiz_attempt_id], user: current_user).first


  end



  private

  def set_quiz
    @quiz = ModuleQuiz.find(params[:quiz_id])
  end

  def responses_params
    params.require(:responses).permit(quiz_attempts_attributes: [:quiz_question_id, :question_answer_id])
  end


end
