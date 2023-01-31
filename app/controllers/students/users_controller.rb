class Students::UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'workstation'

  def show
    @user = User.find(params[:id])
    redirect_to students_courses_path, alert: 'Acceso Denegado' if @user.admin?
  end

end
