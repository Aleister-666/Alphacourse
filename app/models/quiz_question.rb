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
  ################# Callbacks #####################################
  after_create :increment_sum_total_quiz
  after_update :update_sum_total_quiz, if: :saved_change_to_score?
  after_destroy :update_sum_total_quiz
  
  ################# MODULE QUIZ RELATION ##########################
  belongs_to :module_quiz
  
  ################ QUESTION ANSWER RELATION #######################
  has_many :question_answers, inverse_of: :quiz_question, dependent: :destroy
  accepts_nested_attributes_for :question_answers, reject_if: :all_blank

  ################ ACTION TEXT MODULE ############################
  has_rich_text :description

  ################ LIST DEFINITION ###############################
  acts_as_list scope: [:module_quiz_id]

  ############### QUESTION ATTEMPT RELATION ######################
  has_many :question_attempts, dependent: :destroy
  
  ################ QUESTION TYPE ENUM DEFINITION #################
  enum :question_type, { multichoice: 1, truefalse: 2 }, default: :multichoice


  ############### VALIDATIONS ####################################
  validates :title, :description, :module_quiz, :question_answers, presence: true
  validates :score, presence: true, numericality: true

  ############### CUSTOM VALIDATION ###############################
  validate :required_one_correct_answer, :only_one_correct_answer


  ################ PUBLIC METHODS ################################
  def max_point_answer
    QuestionAnswer.where(quiz_question: self.id).order(fraction: :desc).first
  end

  ################ PRIVATE METHODS ###############################

  private

  def required_one_correct_answer
    filtered = question_answers.select { |e| e.fraction == 1.0 }

    if filtered.size == 0
      errors.add(:question_answers, I18n.t(
        'activerecord.errors.models.quiz_question.attributes.question_answers.required_one'
        ))
    end
  end

  def only_one_correct_answer
    filtered = question_answers.select { |e| e.fraction == 1.0 }

    if filtered.size > 1
      errors.add(:question_answers, I18n.t(
        'activerecord.errors.models.quiz_question.attributes.question_answers.only_one'
        ))
      
    end
  end


  ################# CALLBACKS FUNCTIONS ###########################
  def increment_sum_total_quiz
    quiz = self.module_quiz
    quiz.sum_values += self.score
    quiz.save
  end

  
  def update_sum_total_quiz
    quiz = self.module_quiz
    quiz.sum_values = quiz.quiz_questions.map(&:score).sum
    quiz.save
  end


end
