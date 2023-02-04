class Students::Courses::Modules::PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page
  before_action { lock_for_visible(@page.course_module.course) }
  before_action { lock_for_inscription(@page.course_module.course) }


  layout 'workstation'

  def show
    current_user.module_complete!(@page.course_module)
  end


  private

  def set_page
    @page = ModulePage.find(params[:id])
  end
end
