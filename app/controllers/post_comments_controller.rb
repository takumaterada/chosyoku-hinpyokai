class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comments_params)
    @comment.post_id = @post.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
    else
      @post = Post.find(params[:post_id])
      @user = @post.user
      @post_tags = @post.tags
      @post_comment = PostComment.new
      render :error
    end
  end

  def destroy
    @comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    flash.now[:alert] = '投稿を削除しました'
    @post = Post.find(params[:post_id])  #renderしたときに@postのデータがないので@postを定義
  end

  private


  def post_comments_params
    params.require(:post_comment).permit(:comment)
  end

end
