class LikesController < ApplicationController
	respond_to :js

	def like
	  @user = current_user
	  @post = Post.find(params[:post_id])
	  @user.like!(@post)
	  respond_to do |format|
	      format.html {redirect_to :back}
	      format.js {}
	  end
	end

	def unlike
	  @user = current_user
	  @like = @user.likes.find_by_post_id(params[:post_id])
	  @post = Post.find(params[:post_id])
	  @like.destroy!
	  respond_to do |format|
	      format.html {redirect_to :back}
	      format.js {}
	  end
	end
end
