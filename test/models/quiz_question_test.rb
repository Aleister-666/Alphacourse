# == Schema Information
#
# Table name: quiz_questions
#
#  id             :bigint           not null, primary key
#  position       :integer
#  question_type  :integer          default("multichoice"), not null
#  score          :decimal(12, 7)   default(0.0)
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  module_quiz_id :bigint           not null
#
# Indexes
#
#  index_quiz_questions_on_module_quiz_id  (module_quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (module_quiz_id => module_quizzes.id) ON DELETE => cascade
#
require "test_helper"

class QuizQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
