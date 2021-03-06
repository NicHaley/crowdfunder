class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@pledge = @user.pledges.build
		@reward = @user.rewards.build
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			auto_login(@user)
			redirect_to projects_url
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
	end
end
