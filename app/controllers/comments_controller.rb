class CommentsController < ApplicationController
	before_filter :load_project
	before_filter :require_login, only: [:create, :destroy]

	def show
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = @project.comments.build(comment_params)
		@comment.user = current_user

		if @comment.save
			redirect_to projects_path, notice: 'Comment created successfully'
		else
			render 'project/show'
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:post, :project_id)
	end

	def load_project
		@project = Project.find(params[:project_id])
	end
end
