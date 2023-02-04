class Students::Courses::Modules::QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz
  before_action { lock_for_visible(@quiz.course_module.course) }
  before_action { lock_for_inscription(@quiz.course_module.course) }

  layout 'workstation'

  def show
    @user_attempts = QuizAttempt.where(module_quiz: @quiz, user: current_user).all
  end

  private

  def set_quiz
    @quiz = ModuleQuiz.find(params[:id])
  end

  
end
