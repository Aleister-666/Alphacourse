# == Schema Information
#
# Table name: question_attempts
#
#  id                 :bigint           not null, primary key
#  fraction           :decimal(12, 7)
#  max_score          :decimal(12, 7)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_answer_id :bigint           not null
#  quiz_attempt_id    :bigint           not null
#  quiz_question_id   :bigint           not null
#
# Indexes
#
#  index_question_attempts_on_question_answer_id  (question_answer_id)
#  index_question_attempts_on_quiz_attempt_id     (quiz_attempt_id)
#  index_question_attempts_on_quiz_question_id    (quiz_question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_answer_id => question_answers.id) ON DELETE => cascade
#  fk_rails_...  (quiz_attempt_id => quiz_attempts.id) ON DELETE => cascade
#  fk_rails_...  (quiz_question_id => quiz_questions.id) ON DELETE => cascade
#
require "test_helper"

class QuestionAttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
