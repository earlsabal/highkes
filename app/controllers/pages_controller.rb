class PagesController < ApplicationController
		before_action :authenticate_user!
	def dashboard
		@user = User.find(current_user)
		@posts = @user.posts.all
	end

	def profile
		@user = User.find(params[:id])
		@posts = @user.posts.all
	end

	def your_likes
		@user = User.find(current_user)
		@posts = @user.liked_posts.all
	end
end
