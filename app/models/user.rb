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

  # Verifica si un usuario esta incrito en un curso o no.
  # @param course [Course]
  # @return [True|False]
  def course_inscript?(course)
    self.courses.exists?(course.id)
  end

  # Verifica si un usuario completo un modulo de curso o no
  # @param course_module [CourseModule]
  # @return [True|False]
  def module_completation?(course_module)
    self.course_module_completations.exists?(course_module_id: course_module.id, completed: true)
  end

  # Verifica si un usuario competo un modulo de curso,
  # De no tener completado el modulo, entonces crear un
  # registro en la base de datos completando el modulo
  # Si ya completo ese modulo entonces no realiza ninguna accion adicional
  # @param course_module [CourseModule]
  # @return [CourseModuleCompletation]
  def module_complete!(course_module)
    unless module_completation?(course_module)
      complete = self.course_module_completations.build(course_id: course_module.course_id ,course_module:, completed: true)

      complete.save
    end
  end


  # Calcula el progreso de un usuario en un curso dado
  # usando los modulos de dicho curso como referencia
  # @param course [Course]
  # @return [Float]
  def course_progress(course)
    total_modules_course = course.course_modules.size
    modules_complete = self.course_module_completations.select { |e| e.course_module.course_id == course.id }.size

    return (modules_complete * 100) / total_modules_course
  end

  # Verifica si un curso ha sido completado por un usuario
  # @params course [Course]
  # @return [Course]
  def course_completation?(course)
    self.courses_users.exists?(course_id: course.id, completed: true)
  end

  # Devuelve el regitro de la base de datos, ya sea que este
  # completado o no
  # @param course [Course]
  # @return [CourseCompletation]
  def course_completation(course)
    self.courses_users.select { |e| e.course_id == course.id }.first
  end

  # Desinscribe a un usuario de un curso: Elimina su inscripcion,
  # sus modulos completados, sus cursos completados
  # su registro en los cuestionarios, sus respuestas a los cuestionarios,
  # y su progreso general en el curso
  # @param course [Course]
  # @return [True|False]
  def desinscription_course(course)
    inscripcion = CoursesUser.find_by(user_id: self.id, course: course)
    modules_completations = self.course_module_completations.select do |e|
      e.course_module.course_id == course.id
    end

    quiz_attempts = self.quiz_attempts.select do |e|
      e.module_quiz.course_id == course.id
    end

    if inscripcion.destroy && modules_completations.each(&:destroy) && quiz_attempts.each(&:destroy)
      true
    else
      false
    end
  end
end
