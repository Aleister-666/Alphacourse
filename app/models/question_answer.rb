# == Schema Information
#
# Table name: question_answers
#
#  id               :bigint           not null, primary key
#  fraction         :decimal(12, 7)   default(0.0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  quiz_question_id :bigint           not null
#
# Indexes
#
#  index_question_answers_on_quiz_question_id  (quiz_question_id)
#
# Foreign Keys
#
#  fk_rails_...  (quiz_question_id => quiz_questions.id) ON DELETE => cascade
#
class QuestionAnswer < ApplicationRecord
  ################### QUIZ QUESTION RELATION ##########################
  belongs_to :quiz_question

  ################## ACTION TEXT MODULE ###############################
  has_rich_text :answer
  has_rich_text :feedback


  ################## VALIDATIONS ######################################
  validates :answer, presence: true
  validates :fraction, numericality: true
  validates :quiz_question, presence: true

end
