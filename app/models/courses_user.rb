# == Schema Information
#
# Table name: courses_users
#
#  id         :bigint           not null, primary key
#  completed  :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_courses_users_on_course_id  (course_id)
#  index_courses_users_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
class CoursesUser < ApplicationRecord
  ################# COURSE RELATION #################
  belongs_to :course
  ################## USER RELATION ##################
  belongs_to :user

  ################## VALIDATIONS ########################
  validates :course, uniqueness: true

  validates :completed, inclusion: { in: [ true, false ] }



  # Calcula el progreso de un usuario en un curso dado
  # usando los modulos de dicho curso como referencia
  # @param course [Course]
  # @return [Float]
  # def self.progress(course, user)
  #   total_modules_course = course.course_modules.size
  #   modules_complete = user.course_module_completations.select { |e| e.course_module.course_id == course.id }.size

  #   return (modules_complete * 100) / total_modules_course
  # end
  
end
