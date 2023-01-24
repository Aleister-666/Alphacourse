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
  # Valores faccionarios permtidos para las respuestas
  VALID_SCORES = *("0.0".."1.0").freeze

  ################### QUIZ QUESTION RELATION ##########################
  belongs_to :quiz_question

  ################## QUESTION ATTEMPT RELATION ########################
  has_many :question_attempts, dependent: :destroy
  
  ################## ACTION TEXT MODULE ###############################
  has_rich_text :answer
  has_rich_text :feedback


  ################## VALIDATIONS ######################################
  validates :answer, :quiz_question, presence: true
  validates :fraction, numericality: true


  ################## PUBLIC METHODS ###########################

  # Obtiene los valores permitidos para una respuestas
  # de cuestionario, despues los formatea de fomra que
  # pueda ser utilizado para selects, checkboxes, etc
  # @param type [String] Default: 'multichoice'
  # @return [Array]
  def self.permited_scores(type: 'multichoice')
    return [[0, 0.0], [100, 1.0]] if type.eql?('truefalse')

    VALID_SCORES.map { |e| [(e.to_f * 100).to_i, e.to_f] }
  end

end
