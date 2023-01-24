# == Schema Information
#
# Table name: course_module_completations
#
#  id               :bigint           not null, primary key
#  completed        :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  course_module_id :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_course_module_completations_on_course_module_id  (course_module_id)
#  index_course_module_completations_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_module_id => course_modules.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
class CourseModuleCompletation < ApplicationRecord
  after_create :check_completed_course!

  ################### Course Module AND USER RELATIONS ######################
  belongs_to :course_module
  belongs_to :user

  ################## VALIDATIONS ########################################
  validates :course_module, :user, presence: true


  private


  # Checa si un curso ha sido completado, de estarlo
  # verifica si el registro existe y si existe, lo actualiza,
  # si no existe crea uno nuevo y lo marca como completado
  # @return [CourseCompletation]
  def check_completed_course!
    course = self.course_module.course

    # Obtiene el registro de completacion del curso
    course_completation = self.user.course_completation(course) 

    if self.user.course_progress(course) >= 100
      # Si no hay registro, se crea uno nuevo      
      # y se marca el curso como completado
      if course_completation.nil?
        completed = self.user.course_completations.build(course:, completed: true)

        completed.save
      elsif !course_completation.nil? && course_completation.completed == false
        # Si existe un registro y en ese registro el curso
        # no esta completado, entonces actualizamos el registro
        # y completamos el curso
        course_completation.completed = true
        course_completation.save  
      end
    end
  end
end
