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
		@project = Project.find(params[:id])
		@comment = @project.comments.build
		@reward = @project.rewards.build
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :amount, :tagline, :photo, :end_date, :start_date, rewards_attributes: [:min_amount, :description, :_destroy])
	end
end
