# == Schema Information
#
# Table name: courses_users
#
#  id         :bigint           not null, primary key
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
  ################## COURSE RELATION #########################
  belongs_to :course

  ################## USER RELATION ###########################
  belongs_to :user


  ################## VALIDATIONS #############################
  validates :course, presence: true
  validates :user, presence: true
  
end
