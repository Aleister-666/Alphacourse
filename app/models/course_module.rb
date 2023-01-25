# == Schema Information
#
# Table name: course_modules
#
#  id                :bigint           not null, primary key
#  instanceable_type :string           not null
#  position          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  course_id         :bigint           not null
#  instanceable_id   :bigint           not null
#  section_id        :bigint           not null
#
# Indexes
#
#  index_course_modules_on_course_id     (course_id)
#  index_course_modules_on_instanceable  (instanceable_type,instanceable_id)
#  index_course_modules_on_section_id    (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id) ON DELETE => cascade
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#
class CourseModule < ApplicationRecord
  ############### INSTANCEABLE PYLYMORPHIC RELATION ###################
  belongs_to :instanceable, polymorphic: true

  ############### COURSE RELATION #####################################
  belongs_to :course

  ############### SECTION RELATION ####################################
  belongs_to :section

  ################# COURSE MODULE COMPLETATION RELATIONS ##################
  has_many :course_module_completations, dependent: :destroy
  
  has_many :users, through: :course_module_completations

  ############### LIST DEFINITION #####################################
  acts_as_list scope: [:section_id]

  ############### VALIDATIONS #########################################
  validates :course, presence: true
  validates :section, presence: true

  ############### PUBLIC METHODS #############

  # Devuelve el tipo de modulo de curso
  # usando su relacion polimorfica
  # @return [String]
  def type_name
    name = self.instanceable_type.sub('Module', '')
    
    I18n.t("course_module.type_name.#{name.downcase}")

  end
  
end
