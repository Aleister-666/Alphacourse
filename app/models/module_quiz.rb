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

  ###################### ACTION TEXT MODULE ##########################
  has_rich_text :description


  ##################### VALIDATIONS ##################################
  validates :title, presence: true
  validates :value, numericality: true
  validates :min_value, numericality: true
  validates :sum_values, numericality: true
  validates :section, presence: true

  validate :max_value


  #################### PRIVATE METHODS ################################

  private

  def max_value
    if self.min_value > self.value
      errors.add(:min_value, I18n.t('activerecord.errors.models.module_quiz.attributes.min_value.derbording'))      
    end
  end
end
