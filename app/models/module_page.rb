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
  has_one :course_module, as: :instanceable
  belongs_to :section
  has_rich_text :content

  validates :title, presence: true
end
