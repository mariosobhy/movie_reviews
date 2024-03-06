require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV files"
  task movies_and_reviews: :environment do
    # Import actors
    CSV.foreach("#{Rails.root}/csv/movies.csv", headers: true) do |row|
      actor_name = row['Actor']
      Actor.find_or_create_by(name: actor_name)
    end

    # Import locations
    CSV.foreach("#{Rails.root}/csv/movies.csv", headers: true) do |row|
      location_name = row['Filming location']
      country = row['Country']
      Location.find_or_create_by(filming_location: location_name, country: country)
    end

    # Import movies and associate actors
    CSV.foreach("#{Rails.root}/csv/movies.csv", headers: true) do |row|
      movie_title = row['Movie']
      movie = Movie.find_by(title: movie_title)
    
      unless movie.present?
        movie = Movie.create!(
          title: row['Movie'],
          description: row['Description'],
          year: row['Year'],
          director: row['Director']
        )
      end
    
      actor_name = row['Actor']
      actor = Actor.find_or_create_by(name: actor_name)
    
      movie.actors << actor unless movie.actors.include?(actor)
    end
    
    # Import movies and associate locations
    CSV.foreach("#{Rails.root}/csv/movies.csv", headers: true) do |row|
      movie_title = row['Movie']
      movie = Movie.find_by(title: movie_title)
      location_name = row['Filming location']
      location = Location.find_by(filming_location: location_name)

      movie.locations << location unless movie.locations.include?(location)
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

      average_rating = movie.reviews.average(:stars).to_f.round(2)
      movie.update(average_rating: average_rating)
    end

    puts "Import completed!"
  end
end
