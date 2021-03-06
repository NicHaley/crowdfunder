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

		@project = Project.find(params[:id])
		@comment = @project.comments.build

		@pledge = @project.pledges.build

	end

	def edit
		@project = Project.find(params[:id])
		# authorize! :edit, @project
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
		@project = Project.find(params[:id])
		@project.destroy
		respond_to do |format|
			format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	def set_project
		@project = Project.find(params[:id])
	end
	def project_params
		params.require(:project).permit(:name, :description, :amount, :tagline, :photo, :end_date, :start_date, rewards_attributes: [:reward_name, :min_amount, :description, :_destroy])
	end
end
