class PledgesController < ApplicationController
	before_filter :load_project

	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = @user.pledges.build(pledge_params)
		# @pledge.user = current_user

		if @pledge.save
			redirect_to projects_path, notice: 'Comment created successfully'
		else
			render 'user/pledge'
		end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:amount, :user_id)
	end

	def load_project
		@user = User.find(params[:user_id])
	end
end
