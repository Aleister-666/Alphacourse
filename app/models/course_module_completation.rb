# == Schema Information
#
# Table name: course_module_completations
#
#  id               :bigint           not null, primary key
#  complete         :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  course_module_id :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_course_module_completations_on_course_module_id  (course_module_id)
#  index_course_module_completations_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_module_id => course_modules.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
class CourseModuleCompletation < ApplicationRecord
  ################### Course Module AND USER RELATIONS ######################
  belongs_to :course_module
  belongs_to :user

  ################## VALIDATIONS ########################################
  validates :course_module, :user, presence: true

end