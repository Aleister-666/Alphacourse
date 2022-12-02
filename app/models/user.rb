# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("student"), not null
#  username               :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  ################# COURSE USER RELATIONS ##################
  has_many :courses_users, dependent: :destroy
  has_many :courses, through: :courses_users
  


  ################# COURSE MODULE COMPLETATION RELATIONS ##################
  has_many :course_module_completations, dependent: :destroy
  
  has_many :course_modules, through: :course_module_completations


  ################ QUIZ ATTEMPT RELATION ##################################
  has_many :quiz_attempts, dependent: :destroy

  ###################### DEVISE MODULES ####################
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ################# ROLE ENUM DEFINITION ##################
  enum :role, { admin: 0, student: 1 }, default: :student


  ################# VALIDATIONS ###########################
  validates :username, presence: true

  ################# PUBLIC METHODS ########################

  def course_inscript?(course)
    return self.courses.exists?(course.id)
  end

  def module_completation?(course_module)
    return self.course_module_completations.exists?(course_module_id: course_module.id, complete: true)
  end

  def completation_create?(course_module)
    return self.course_module_completations.exists?(course_module_id: course_module.id)
  end
end
