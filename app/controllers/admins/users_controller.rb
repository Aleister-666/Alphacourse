class Admins::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_user, only: %i[ show destroy ]
  layout 'workstation'

  def show; end

  def index
    @pagy, @users = pagy(User.all, items: 20)
  end

  def destroy
    if @user
      @user.destroy
      redirect_to admins_users_path, notice: 'Usuario Eliminado'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


end
