class Admins::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_course, only: %i[ new create ]
  before_action :set_section, only: %i[ edit update destroy ]


  def new
    @section = @course.sections.build
  end
  
  def create
    @section = @course.sections.build(sections_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to admins_course_path(@course) }
        format.turbo_stream { flash.now[:notice] = t('sections.actions.create.notice') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end 
  end

  def edit
  end

  def update
    respond_to do |format|
      if @section.update(sections_params)
        format.html { redirect_to admins_course_path(@section.course_id) }
        format.turbo_stream { flash.now[:notice] = t('sections.actions.create.notice') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:alert] = t('sections.actions.destroy.alert') }
    end

  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def sections_params
    params.require(:section).permit(:title)
  end


end
