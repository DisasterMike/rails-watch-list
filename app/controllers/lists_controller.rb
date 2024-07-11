class ListsController < ApplicationController
  def index
    @lists = List.all
    # @top5Movies = Movie.all[1..5]
    movies = Movie.all
    @topMovies = []
    until @topMovies.length >= 5 do
      movie = movies.sample
      @topMovies << movie unless @topMovies.include? movie
    end
    # raise
  end

  def show
    @list = List.find(params[:id])
    @movieList = @list.movies.any? ? "" : "No movies added yet";
  end

  def new
    @list = List.new
  end

  def create
    # raise
    @list = List.new(list_params)
    @list.name.capitalize!
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # raise
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path("all"), status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
