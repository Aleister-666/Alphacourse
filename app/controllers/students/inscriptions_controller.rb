class Students::InscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    course = Course.find(params[:course_id])

    if course
      course.courses_users.build(user: current_user)
      if course.save!
        redirect_to students_course_path(course), notice: 'Inscrito en el Curso'
      else
        redirect_to students_course_path(course), alert: 'Inscripcion Fallida'
      end
      
    else
      raise ApplicationController::RoutingError.new('Not Found')
    end
  end

  def destroy
    course = Course.find(params[:course_id])


    if current_user.desinscription_course(course)
      redirect_to students_courses_path, alert: 'Inscripcion Eliminada'
    end


  end
end
