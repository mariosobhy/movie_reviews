# spec/models/review_spec.rb

require 'rails_helper'

RSpec.describe Review, type: :model do
  it "is valid with valid attributes" do
    review = Review.new(movie: Movie.new, user: "John Doe", stars: 4, review: "Great movie!")
    expect(review).to be_valid
  end

  it "is not valid without a user" do
    review = Review.new(user: nil)
    expect(review).to_not be_valid
  end

  it "is not valid without stars" do
    review = Review.new(stars: nil)
    expect(review).to_not be_valid
  end
end
