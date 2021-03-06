class PagesController < ApplicationController
		before_action :authenticate_user!
	def dashboard
		@user = User.find(current_user)
		@posts = @user.posts.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
	end

	def profile
		@user = User.find(params[:id])
		@posts = @user.posts.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
	end

	def your_likes
		@user = User.find(current_user)
		@posts = @user.liked_posts.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
	end
end
