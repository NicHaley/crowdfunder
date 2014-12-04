class RewardsController < ApplicationController
	before_filter :load_project

	def create
		@reward = @project.rewards.build(reward_params)
		# @reward.pledge.user = current_user
	end

	def destroy
	end

	private
	def reward_params
		params.require(:reward).permit(:min_amount, :title, :description, :project_id)
	end

	def load_project
		@project = Project.find(params[:project_id])
	end
end
