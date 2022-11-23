# == Schema Information
#
# Table name: module_pages
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#
# Indexes
#
#  index_module_pages_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#
require "test_helper"

class ModulePageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
