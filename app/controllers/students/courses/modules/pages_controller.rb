class Students::Courses::Modules::PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page

  layout 'workstation'

  def show
  end


  private

  def set_page
    @page = ModulePage.find(params[:id])
  end
end
