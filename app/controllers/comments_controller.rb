class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		flash[:notice] = "Comment saved!"
		redirect_to post_path(@post)
	end

	def destroy
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.find(params[:id])

	  if @comment.destroy
	    flash[:notice] = "Comment was removed"
	    redirect_to @post
	  else
	    flash[:notice] = "There was an error removing comment"
	    redirect_to [@topic, @post]
	  end
	end 

	private
	def comment_params
		params.require(:comment).permit(:user_name, :body)
	end
end
