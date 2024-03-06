class MovieRepository
  def self.search_by_actor(actor)
    movies = Movie.includes(movie_locations: :location)
                  .left_joins(:actors, :reviews)
                  .group(:id)
                  .order('AVG(reviews.stars) DESC NULLS LAST')

    movies = movies.where("LOWER(actors.name) LIKE ?", "%#{actor.downcase}%") if actor.present?

    movies
  end
end
