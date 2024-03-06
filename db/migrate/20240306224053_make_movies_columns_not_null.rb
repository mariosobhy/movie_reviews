class MakeMoviesColumnsNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :movies, :title, false
    change_column_null :movies, :filming_location, false
    change_column_null :movies, :year, false
    change_column_null :movies, :country, false
  end
end
