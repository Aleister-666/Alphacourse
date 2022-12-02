class Students::Courses::Modules::QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz

  layout 'workstation'

  def show
    @user_attempts = QuizAttempt.where(module_quiz: @quiz, user: current_user).all

  end

  private

  def set_quiz
    @quiz = ModuleQuiz.includes(:quiz_attempts).where(id: params)

    @quiz = ModuleQuiz.find(params[:id])
  end
end
