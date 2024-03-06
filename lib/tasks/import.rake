require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV files"
  task movies_and_reviews: :environment do
    # Import movies
    CSV.foreach("#{Rails.root}/csv/movies.csv", headers: true) do |row|
      Movie.create!(
        title: row['Movie'],
        description: row['Description'],
        year: row['Year'],
        director: row['Director'],
        actor: row['Actor'],
        filming_location: row['Filming location'],
        country: row['Country']
      )
    end

    # Import reviews
    CSV.foreach("#{Rails.root}/csv/reviews.csv", headers: true) do |row|
      movie = Movie.find_by(title: row['Movie'])
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
