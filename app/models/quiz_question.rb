# == Schema Information
#
# Table name: quiz_questions
#
#  id             :bigint           not null, primary key
#  position       :integer
#  question_type  :integer          default("multichoice"), not null
#  score          :decimal(12, 7)   default(0.0)
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  module_quiz_id :bigint           not null
#
# Indexes
#
#  index_quiz_questions_on_module_quiz_id  (module_quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (module_quiz_id => module_quizzes.id) ON DELETE => cascade
#
class QuizQuestion < ApplicationRecord
  ################# MODULE QUIZ RELATION ##########################
  belongs_to :module_quiz
  
  ################ QUESTION ANSWER RELATION #######################
  has_many :question_answers, inverse_of: :quiz_question, dependent: :destroy
  accepts_nested_attributes_for :question_answers, reject_if: :all_blank

  ################ ACTION TEXT MODULE ############################
  has_rich_text :description


  ################ LIST DEFINITION ###############################
  acts_as_list scope: [:module_quiz_id]

  ################ QUESTION TYPE ENUM DEFINITION #################
  enum :question_type, { multichoice: 1, truefalse: 2 }, default: :multichoice


  ############### VALIDATIONS ####################################
  validates :title, presence: true
  validates :description, presence: true
  validates :score, numericality: true

  ################ PUBLIC METHODS ################################
  def select_correct_choice(choice)
    
    if self.multichoice?
      answers = self.question_answers

      selected = answers.select { |e| e.id == choice }.first

      if selected.fraction == 1
        return "Respuesta correcta"
      else
        return "respuesta incorrecta"
      end
    end
  end

  def max_point_answer
    QuestionAnswer.where(quiz_question: self.id).order(fraction: :desc).first
  end

end
