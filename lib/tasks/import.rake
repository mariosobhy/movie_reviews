require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV files"
  task movies_and_reviews: :environment do
    # Import actors
    CSV.foreach("#{Rails.root}/csv/movies.csv", headers: true) do |row|
      actor_names = row['Actor'].split(',').map(&:strip)
      actor_names.each do |actor_name|
        Actor.find_or_create_by(name: actor_name)
      end
    end

    # Import movies and associate actors
    CSV.foreach("#{Rails.root}/csv/movies.csv", headers: true) do |row|
      movie_title = row['Movie']
      movie = Movie.find_by(title: movie_title)
      next if movie # Skip if movie already imported

      movie = Movie.create!(
        title: row['Movie'],
        description: row['Description'],
        year: row['Year'],
        director: row['Director'],
        filming_location: row['Filming location'],
        country: row['Country']
      )

      # Associate actors with the movie
      actor_names = row['Actor'].split(',').map(&:strip)
      actor_names.each do |actor_name|
        actor = Actor.find_by(name: actor_name)
        movie.actors << actor unless movie.actors.include?(actor)
      end
    end

    # Import reviews
    CSV.foreach("#{Rails.root}/csv/reviews.csv", headers: true) do |row|
      movie = Movie.find_by(title: row['Movie'])
      next if movie.nil?

      Review.create!(
        movie_id: movie.id,
        user: row['User'],
        stars: row['Stars'],
        review: row['Review']
      )
    end

    puts "Import completed!"
  end
end
