class AddIndexToReviewsStars < ActiveRecord::Migration[7.0]
  def change
    add_index :reviews, :stars
  end
end
