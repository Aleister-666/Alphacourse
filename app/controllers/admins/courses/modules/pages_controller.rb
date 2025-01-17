class Admins::Courses::Modules::PagesController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!
	before_action :set_section, only: %i[ new create ]
	before_action :set_page, only: %i[ show edit update destroy ]
	
	layout 'workstation'

	def new
		@page = @section.module_pages.build
	end

	def create
		@page = @section.module_pages.build(pages_params)
		@page.course_module = CourseModule.new(course_id: @section.course_id, section_id: @section.id)
		
		respond_to do |format|
			if @page.save
				format.html { redirect_to admins_course_path(@section.course_id), notice: 'Modulo Pagina: Creado' }				
			else
				format.html { render :new, status: :unprocessable_entity }
			end
		end
	end

	def show
	end

	def edit
	end

	def update
		respond_to do |format|
			if @page.update(pages_params)
				format.html {
					redirect_to admins_course_path(@page.course_module.course_id), notice: 'Modulo Pagina: Actualizado'
				}
			else
				format.html {
					render :edit, status: :unprocessable_entity
				}
			end
		end
	end

	def destroy
		@page.destroy

		respond_to do |format|
			format.html {
				redirect_to admins_course_path(@page.course_module.course_id), notice: 'Modulo Pagina: Eliminado'
			}
		end
	end


	private

	def set_section
		@section = Section.find(params[:section_id])
	end

	def set_page
		@page = ModulePage.find(params[:id])
	end

	def pages_params
    params.require(:module_page).permit(:title, :content)
  end
end
