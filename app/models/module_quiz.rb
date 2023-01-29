# == Schema Information
#
# Table name: module_quizzes
#
#  id         :bigint           not null, primary key
#  min_value  :decimal(12, 7)   default(0.0)
#  sum_values :decimal(12, 7)   default(0.0)
#  title      :string           not null
#  value      :decimal(12, 7)   default(100.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#
# Indexes
#
#  index_module_quizzes_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#
class ModuleQuiz < ApplicationRecord
  ###################### SECTION RELATION ############################
  belongs_to :section

  ###################### COURSE MODULE RELATIONS #####################
  has_one :course_module, as: :instanceable, dependent: :destroy

  ###################### QUIZ QUESTION RELATIONS #####################
  has_many :quiz_questions, dependent: :destroy

  ##################### QUIZ ATTEMPT RELATION ########################
  has_many :quiz_attempts, dependent: :destroy

  ###################### ACTION TEXT MODULE ##########################
  has_rich_text :description


  ##################### VALIDATIONS ##################################
  validates :title, :section, presence: true
  validates :value, :min_value, :sum_values, numericality: true

  #################### CUSTOM VALIDATION ############################
  validate :max_value


  #################### PUBLIC METHODS ##############################


  # Obtiene el id del curso al que pertenece
  # el modulo de cuestionario
  # @return [Integer]
  def course_id
    self.section.course_id
  end

  #################### PRIVATE METHODS ################################

  private

  # Valida que el valor minimo y el valor
  # general del cuestionario no sean nulo,
  # y ademas valida que el valor minimo del
  # cuestionario no sea mayor al valor general del mismo
  # @return [ActiveRecordValidation]
  def max_value

    if (!self.min_value.nil? && !self.value.nil?) && self.min_value > self.value
      errors.add(:min_value, I18n.t(
        'activerecord.errors.models.module_quiz.attributes.min_value.derbording'
      ))      

    end
    
  end

end
