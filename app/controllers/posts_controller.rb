class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      @posts = Post.page(params[:page])
      render 'index'
    end
  end

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find[params:id]
  end

  def edit
    @post = Post.find[params:id]
  end

  def update
    @post = Post.find[params:id]
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find[params:id]
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :describe, :user_id, :score_taste, :score_price, :score_stomach, :score_nutrition, :score_easy,
    :image, :genre_id, :shop_name, :shop_address, :shop_longitude, :shop_latitude)
  end

end
