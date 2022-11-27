# == Schema Information
#
# Table name: question_answers
#
#  id               :bigint           not null, primary key
#  fraction         :decimal(12, 7)   default(0.0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  quiz_question_id :bigint           not null
#
# Indexes
#
#  index_question_answers_on_quiz_question_id  (quiz_question_id)
#
# Foreign Keys
#
#  fk_rails_...  (quiz_question_id => quiz_questions.id) ON DELETE => cascade
#
require "test_helper"

class QuestionAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
