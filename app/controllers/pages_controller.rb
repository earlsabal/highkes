class PagesController < ApplicationController
	def dashboard
		@user = User.find(current_user.id)
		@posts = @user.posts.all
	end

	def profile
		@user = User.find(params[:id])
		@posts = @user.posts.all
	end
end
