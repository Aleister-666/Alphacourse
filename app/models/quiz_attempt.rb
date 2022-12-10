# == Schema Information
#
# Table name: quiz_attempts
#
#  id             :bigint           not null, primary key
#  sum_scores     :decimal(12, 7)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  module_quiz_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_quiz_attempts_on_module_quiz_id  (module_quiz_id)
#  index_quiz_attempts_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (module_quiz_id => module_quizzes.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
class QuizAttempt < ApplicationRecord
  ################## MODULE QUIZ RELATION ######################
  belongs_to :module_quiz

  ################# USER RELATION #############################
  belongs_to :user

  ################# QUESTION ATTEMPTS RELATION ###############
  has_many :question_attempts, dependent: :delete_all

  ################# VALIDATIONS #############################

  validates :module_quiz, :user, presence: true

  ################# PUBLIC METHODS #########################

  def set_sum_scores
    result = self.question_attempts.map(&:real_score).sum

    self.sum_scores = result
    self.save
  end

  def result_quiz
    questions_score = self.sum_scores
    quiz_value = self.module_quiz.value
    quiz_questions_value = self.module_quiz.sum_values

    return ((questions_score * quiz_value) / quiz_questions_value).floor(2)
  end

  
end