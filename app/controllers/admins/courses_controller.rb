class Admins::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  
  before_action :set_course, only: %i[ show edit update destroy ]

  layout 'workstation'

  # GET admins/courses
  def index
    filtered = Course.where('name ILIKE ?', "%#{params[:name]}%")
    @pagy, @courses = pagy(filtered.all, items: 15)
  end

  # GET admins/courses/1
  def show
  end

  # GET admins/courses/new
  def new
    @course = Course.new
  end

  # GET admins/courses/1/edit
  def edit
  end

  # POST admins/courses
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to admins_courses_path }
        format.turbo_stream { flash.now[:notice] = t('courses.actions.create.notice') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to admins_course_path(@course) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to admins_courses_path, alert: t('courses.actions.destroy.alert') }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :description, :visible, :cover)
    end
end
