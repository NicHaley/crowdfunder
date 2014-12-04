class PledgesController < ApplicationController

	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = current_user.pledges.build(pledge_params)

		if @pledge.save
			redirect_to projects_path, notice: 'Pledge created successfully'
		else
			render 'user/pledge'
		end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:reward_id, :amount, :user_id)
	end
end
