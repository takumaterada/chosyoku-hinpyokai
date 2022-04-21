class SearchesController < ApplicationController

  def search

    if params[:name].present?
      @posts = Post.where('name LIKE ?', "%#{params[:name]}%")
      @posts = @posts.page(params[:page])
    else
      @posts = Post.none
    end
    render "searches_result"
  end

  def search_result
  end

end
