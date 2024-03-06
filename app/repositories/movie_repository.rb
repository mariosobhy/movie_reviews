class MovieRepository
  def self.search_by_actor(actor)
    movies = Movie.left_joins(:actors, :reviews)
                  .group(:id)
                  .order('AVG(reviews.stars) DESC NULLS LAST')

    if actor.present?
      movies = movies.where("LOWER(actors.name) LIKE ?", "%#{actor.downcase}%")
    end

    movies
  end
end
