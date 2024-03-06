# db/migrate/20240306120100_create_reviews.rb

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :movie, foreign_key: true
      t.string :user
      t.integer :stars
      t.text :review

      t.timestamps
    end

    add_index :reviews, :user
  end
end
