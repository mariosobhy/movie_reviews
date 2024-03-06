# spec/models/movie_spec.rb

require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is valid with valid attributes" do
    movie = Movie.new(title: "Gone in 60 seconds", year: 2000, actor: "Nicolas Cage")
    expect(movie).to be_valid
  end
end
