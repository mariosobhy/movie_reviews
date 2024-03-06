class MoviesController < ApplicationController
  def index
    @movies = MovieRepository.search_by_actor(params[:actor_search])
  end
end
