# == Schema Information
#
# Table name: course_completations
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
#  index_course_completations_on_course_id  (course_id)
#  index_course_completations_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
require "test_helper"

class CourseCompletationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
