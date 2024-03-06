class RemoveFilmingLocationAndCountryFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :filming_location, :string
    remove_column :movies, :country, :string
  end
end