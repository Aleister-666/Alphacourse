# == Schema Information
#
# Table name: module_pages
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#
# Indexes
#
#  index_module_pages_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#
class ModulePage < ApplicationRecord
  after_create :update_all_completed_course_status

  ####################### SECTION RELATION #######################
  belongs_to :section

  ####################### COURSE MODULE RELATION #################
  has_one :course_module, as: :instanceable, dependent: :destroy

  ####################### ACTION TEXT MODULE #####################
  has_rich_text :content

  ###################### VALIDATIONS #############################
  validates :title, :section, presence: true

  # Obtiene el id del curso de la seccion
  # a la que pertenece el modulo de pagina
  # @return [Integer]
  def course_id
    self.section.course_id
  end

  private

  # Actualiza el registro de completacion de un curso para todos
  # los usuarios que tengan un curso como completo
  # (Este metodo solo se llama cuando se crea un nuevo registro)
  # @return [Array]
  def update_all_completed_course_status
    users_completed = CourseCompletation.where('course_id = ? AND completed = ?', self.course_id, true)
    
    unless users_completed.nil?
      users_completed.update_all(completed: false)
    end
  end

end
