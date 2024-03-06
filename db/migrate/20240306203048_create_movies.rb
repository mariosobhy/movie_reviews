# db/migrate/20240306120000_create_movies.rb

class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :director
      t.string :actor
      t.string :filming_location
      t.string :country

      t.timestamps
    end

    add_index :movies, :title
    add_index :movies, :actor
  end
end
