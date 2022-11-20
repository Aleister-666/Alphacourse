class Students::InscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    course = Course.find(params[:course_id])

    if course
      course.courses_users.build(user_id: params[:user_id])

      if course.save
        redirect_to students_courses_path, notice: 'Inscrito en el Curso'
      else
        redirect_to students_courses_path, alert: 'Inscripcion Fallida'
      end
      
    else
      raise ApplicationController::RoutingError.new('Not Found')
    end
  end

  def destroy
    inscription = CoursesUser.find_by(course_id: params[:course_id], user_id: params[:user_id])

    if inscription
      inscription.destroy
      redirect_to students_courses_path, alert: 'Inscripcion Eliminada'
    end
  end
end
