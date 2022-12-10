class Admins::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  layout 'workstation'
  def index
    @users = User.all
  end
end
