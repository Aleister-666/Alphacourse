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
  ####################### SECTION RELATION #######################
  belongs_to :section

  ####################### COURSE MODULE RELATION #################
  has_one :course_module, as: :instanceable, dependent: :destroy

  ####################### ACTION TEXT MODULE #####################
  has_rich_text :content

  ###################### VALIDATIONS #############################
  validates :title, :content, :section, presence: true

  # Obtiene el id del curso de la seccion
  # a la que pertenece el modulo de pagina
  # @return [Integer]
  def course_id
    self.section.course_id
  end

end
