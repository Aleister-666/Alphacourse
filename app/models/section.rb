# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#
# Indexes
#
#  index_sections_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id) ON DELETE => cascade
#
class Section < ApplicationRecord
  ############### COURSES RELATION #####################
  belongs_to :course

  ################ COURSES MODULES RELATION #################
  has_many :course_modules, dependent: :destroy

  ################ ACTIVITIES PAGES RELATION ###################
  has_many :module_pages, dependent: :destroy

  validates :title, presence: true
end
