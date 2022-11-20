class Students::CoursesController < ApplicationController
  before_action :authenticate_user!

  # GET students/courses
  def index
    @courses = Course.all
  end

  # GET students/courses/1
  def show
    @course = Course.find(params[:id])
  end

  # GET students/my_courses
  def my_courses
    @courses = current_user.courses
  end


end
