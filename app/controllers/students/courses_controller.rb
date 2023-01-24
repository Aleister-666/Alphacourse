class Students::CoursesController < ApplicationController
  before_action :authenticate_user!
  layout 'workstation'

  # GET students/courses
  def index
    filtered = Course.where('name ILIKE ? AND visible = ?', "%#{params[:name]}%", true)
    @pagy, @courses = pagy(filtered.all, items: 15)
  end

  # GET students/courses/1
  def show
    @course = Course.includes(sections: {course_modules: :instanceable}).where(id: params[:id]).first
    lock_for_visible
  end

  # GET students/my_courses
  def my_courses
    @pagy, @courses = pagy(current_user.courses, items: 15)
  end

  private

  def lock_for_visible
    redirect_back_or_to students_courses_path, alert: 'Acceso Invalido' unless @course.visible
  end

end
