class Students::CoursesController < ApplicationController
  before_action :authenticate_user!
  layout 'workstation'

  # GET students/courses
  def index
    @courses = Course.all
  end

  # GET students/courses/1
  def show
    @course = Course.includes(sections: {course_modules: :instanceable}).where(id: params[:id]).first
  end

  # GET students/my_courses
  def my_courses
    @courses = current_user.courses
  end


end
