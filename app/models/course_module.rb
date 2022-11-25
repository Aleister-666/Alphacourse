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
  belongs_to :instanceable, polymorphic: true
  belongs_to :course
  belongs_to :section

  acts_as_list scope: [:section_id]

  def type_name
    self.instanceable_type.sub('Module', '')
  end
end
