class PostCommentsController < ApplicationController

  def create
    @book = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comments_params)
    @comment.post_id = @post.id
    @comment.save
    @post_comment = PostComment.new
  end

  def destroy
    @comment = PostComment.find_by(params[:id], post_id: params[:post_id])
    @comment.destroy
    @post_comment = PostComment.new
  end

  private


  def post_comments_params
    params.require(:post_comment).permit(:comment)
  end

end
