class ProjectsController < ApplicationController
	before_action :require_login, only: [:new, :edit]

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
		@project.rewards.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to projects_url
		else
			render :new
		end
	end

	def show

	end

	def edit
	end

	def update
		@project = Project.find(params[:id])

		if @project.update_attributes(project_params)
			redirect_to project_path(@project)
		else
			render :edit
		end
	end


	def destroy
	end

	private
	def set_project
		@project = Project.find(params[:id])
	end
	def project_params
		params.require(:project).permit(:name, :description, :amount, :tagline, :photo, :end_date, :start_date, rewards_attributes: [:min_amount, :description, :_destroy])
	end
end
