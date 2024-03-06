class MovieRepository
  def self.search_by_actor(actor)
    movies = Movie.left_joins(:reviews)
                  .group(:id)
                  .order('AVG(reviews.stars) DESC NULLS LAST')

    actor.present? ? movies.where("LOWER(movies.actor) LIKE ?", "%#{actor.downcase}%") : movies
  end
end
