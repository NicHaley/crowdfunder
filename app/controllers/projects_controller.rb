class ProjectsController < ApplicationController
	before_action :require_login, only: [:new, :edit]

	def index
		@projects = if params[:search]
			Project.where("name LIKE ?", "%#{params[:search]}%")
		else

			Project.all
		end
		
		@projects = @projects.order('projects.created_at DESC').page(params[:page])

		respond_to do |format|
			format.html
			format.js
		end
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
	end

	def destroy
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :amount, :tagline, :photo, :end_date, :start_date, rewards_attributes: [:min_amount, :description, :_destroy])
	end
end
