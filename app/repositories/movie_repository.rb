class MovieRepository
    def self.search_by_actor(actor)
      movies = Movie.left_joins(:reviews)
                    .group(:id)
                    .order('AVG(reviews.stars) DESC NULLS LAST')
  
      actor.present? ? movies.where("movies.actor LIKE ?", "%#{actor}%") : movies
    end
end
  