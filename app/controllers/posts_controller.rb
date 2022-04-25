class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @tag_list = params[:post][:tag].split(',')
    if @post.save
        @post.save_tag(@tag_list)
        redirect_to post_path(@post)
    else
      render 'new'
    end

  end

  def index
    @posts = Post.all
    if params[:genre_id].present?
      @posts = @posts.where(genre_id: params[:genre_id])
    end
    @posts = @posts.page(params[:page])
    @tag_list = Tag.all
#    @post_like_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id).limit(5))
    @post_like_ranks = Post.left_joins(:favorites).group(:id).order('count(favorites.post_id) desc').limit(5)
#    @post_comment_ranks = Post.find(PostComment.group(:post_id).order('count(post_id) desc').pluck(:post_id).limit(5))
    @post_comment_ranks = Post.left_joins(:post_comments).group(:id).order('count(post_comments.post_id) desc').limit(5)
    @genres = Genre.all
    @genre = params[:genre_id]
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_tags = @post.tags
    @comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.page(params[:page]).per(10)
  end



  private

  def post_params
    params.require(:post).permit(:name, :describe, :tag, :user_id, :score_taste, :score_price, :score_stomach, :score_nutrition, :score_easy,
    :genre_id, :shop_name, :shop_address, :shop_longitude, :shop_latitude, :evaluation, :image)
  end

end