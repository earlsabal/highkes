class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :edit, :update, :destroy, :likes]
	def index
		@posts = Post.all
	end

	def show
		@comments = @post.comments.all
	end

	def new
		@post = Post.new
	end

	def create
		
		@post = Post.create(post_params)
		@post.user_id = current_user.id
		if @post.save
			flash[:success] = "Your post has been created!"
			redirect_to posts_path
		else
			flash[:alert] = "Your new post couldn't be created! Please check the form"
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post updated."
			redirect_to posts_path
		else
			flash.now[:alert] = "Update failed.  Please check the form."
			render :edit
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post deleted."
		redirect_to posts_path
	end

	def likes
		@users = @post.liking_users.all
	end

	private
	def post_params
		params.require(:post).permit(:image, :caption)
	end

	def set_post
    	@post = Post.find(params[:id])
    	@user = @post.user
  	end
end
