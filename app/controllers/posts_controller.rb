class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @tag_list = params[:post][:name].split(',')
    if @post.save
        @post.save_tag(@tag_list)
        redirect_to post_path(@post)
    else
      @posts = Post.page(params[:page])
      render 'index'
    end

  end

  def index
    @posts = Post.page(params[:page])
    @tag_list=Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_tags = @post.tags
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
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
　　　　　　　#検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
　　　　　　　　#検索されたタグに紐づく投稿を表示
    @posts=@tag.posts.page(params[:page]).per(10)
  end

  private

  def post_params
    params.require(:post).permit(:name, :describe, :tag, :user_id, :score_taste, :score_price, :score_stomach, :score_nutrition, :score_easy,
    :genre_id, :shop_name, :shop_address, :shop_longitude, :shop_latitude, :evaluation, :image)
  end

end
