class PagesController < ApplicationController
  def index
    @lists = List.all
    movies = Movie.all
    @topMovies = []
    until @topMovies.length >= 5 do
      movie = movies.sample
      @topMovies << movie unless @topMovies.include? movie
    end
  end
end
