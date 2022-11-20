# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  visible    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_courses_on_name  (name) UNIQUE
#
class Course < ApplicationRecord
  has_many :courses_users, dependent: :destroy
  has_many :users, through: :courses_users
  
  has_rich_text :description

  validates :name, presence: true, uniqueness: true
  validates :visible, presence: true, inclusion: { in: [true, false] }
end
