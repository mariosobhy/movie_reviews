class Location < ApplicationRecord
  has_many :movie_locations
  has_many :movies, through: :movie_locations
end
