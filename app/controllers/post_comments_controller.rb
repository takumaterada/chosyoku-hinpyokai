class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comments_params)
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @comment = PostComment.find_by(params[:id], post_id: params[:post_id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private


  def post_comments_params
    params.require(:post_comment).permit(:comment)
  end

end
