# == Schema Information
#
# Table name: module_quizzes
#
#  id         :bigint           not null, primary key
#  min_value  :decimal(12, 7)   default(0.0)
#  sum_values :decimal(12, 7)   default(0.0)
#  title      :string           not null
#  value      :decimal(12, 7)   default(100.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#
# Indexes
#
#  index_module_quizzes_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#
require "test_helper"

class ModuleQuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
