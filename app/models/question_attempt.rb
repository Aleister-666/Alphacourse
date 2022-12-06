# == Schema Information
#
# Table name: question_attempts
#
#  id                 :bigint           not null, primary key
#  fraction           :decimal(12, 7)
#  max_score          :decimal(12, 7)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_answer_id :bigint           not null
#  quiz_attempt_id    :bigint           not null
#  quiz_question_id   :bigint           not null
#
# Indexes
#
#  index_question_attempts_on_question_answer_id  (question_answer_id)
#  index_question_attempts_on_quiz_attempt_id     (quiz_attempt_id)
#  index_question_attempts_on_quiz_question_id    (quiz_question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_answer_id => question_answers.id) ON DELETE => cascade
#  fk_rails_...  (quiz_attempt_id => quiz_attempts.id) ON DELETE => cascade
#  fk_rails_...  (quiz_question_id => quiz_questions.id) ON DELETE => cascade
#
class QuestionAttempt < ApplicationRecord
  ################ CALLBACKS ########################
  before_save :set_fraction_and_score

  ################ QUIZ ATTEMPT RELATION #############
  belongs_to :quiz_attempt

  ################ QUIZ QUESTION RELATION #####################
  belongs_to :quiz_question

  ################ QUESTION ANSWER RELATION #####################
  belongs_to :question_answer


  ################ VALIDATIONS ##################################
  validates :quiz_attempt, :quiz_question, :question_answer, presence: true

  ################ PUBLIC METHODS ###############################
  def real_score
    return self.fraction * self.max_score
  end

  def result_question

    score = self.real_score

    quiz_value = self.quiz_attempt.module_quiz.value

    quiz_questions_value = self.quiz_attempt.module_quiz.sum_values

    return ((score * quiz_value) / quiz_questions_value).floor(2)
  end


  ############### PRIVATE METHODS #########################

  private

  ############### CALLBACKS FUCTIONS ######################
  def set_fraction_and_score
    self.fraction = self.question_answer.fraction
    self.max_score = self.quiz_question.score
  end

end
