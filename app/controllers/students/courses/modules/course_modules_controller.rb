class Students::Courses::Modules::CourseModulesController < ApplicationController
	before_action :authenticate_user!
end
