class GenresController < ApplicationController

  def index
    @genres = Genre.page(params[:page])
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
    @genres = Genre.page(params[:page])
     render :index
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end


