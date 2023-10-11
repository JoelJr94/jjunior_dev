class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
  
  def create
    @post.comments.create(comments_params.to_h.merge!({user_id: current_user.id}))
    redirect_to post_path(@post), notice: "Comment was succesfully created."
  end

  def destroy
    comment = @post.comments.find(params[:id])
    authorize comment
    
    comment.destroy
    redirect_to post_path(@post), notice: "Comment was succesfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end