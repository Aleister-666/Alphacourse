# == Schema Information
#
# Table name: quiz_attempts
#
#  id             :bigint           not null, primary key
#  sum_scores     :decimal(12, 7)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  module_quiz_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_quiz_attempts_on_module_quiz_id  (module_quiz_id)
#  index_quiz_attempts_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (module_quiz_id => module_quizzes.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
require "test_helper"

class QuizAttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
