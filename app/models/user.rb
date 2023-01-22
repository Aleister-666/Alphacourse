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

  # Verifica si un usuario esta incrito en un curso o no
  # @param course 
  # @return True|False
  def course_inscript?(course)
    self.courses.exists?(course.id)
  end

  # Verifica si un usuario completo un modulo de curso o no
  # @param course_module
  # @return True|False
  def module_completation?(course_module)
    self.course_module_completations.exists?(course_module_id: course_module.id, complete: true)
  end

  # Verifica si un usuario competo un modulo de curso,
  # De no tener completado el modulo, entonces crear un
  # registro en la base de datos completando el modulo
  # Si ya completo ese modulo entonces no realiza ninguna accion adicional
  # @param course_module CourseModule
  # @return CourseModuleCompletation
  def module_complete!(course_module)
    unless module_completation?(course_module)
      complete = self.course_module_completations.build(course_module:, complete: true)

      complete.save
    end
  end

  # Verifica si un usuario tiene un registro de completacion de un curso
  # @param course_module
  # @return True|False
  def completation_create?(course_module)
    self.course_module_completations.exists?(course_module_id: course_module.id)
  end

  # Metodo para desincribir un curso de un usuario, elimina su inscricion, sus modulos completado
  # su registro de intentos de cuestionarios y sus respuestas a preguntas
  # @param course
  # @return True|False
  def desinscription_course(course)
    inscripcion = CoursesUser.find_by(user_id: self.id, course: course)
    modules_completations = self.course_module_completations
    quiz_attempts = self.quiz_attempts

    if inscripcion.destroy && modules_completations.destroy_all && quiz_attempts.destroy_all
      true
    else
      false
    end
  end
end
