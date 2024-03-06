# spec/controllers/movies_controller_spec.rb

require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @movies when no actor search parameter is provided" do
      movie = Movie.create(title: "Gone in 60 seconds", year: 2000, actor: "Nicolas Cage")
      get :index
      expect(assigns(:movies)).to eq([movie])
    end

    it "assigns @movies filtered by actor" do
      movie1 = Movie.create(title: "Gone in 60 seconds", year: 2000, actor: "Nicolas Cage")
      movie2 = Movie.create(title: "The Matrix", year: 1999, actor: "Keanu Reeves")

      get :index, params: { actor_search: "Nicolas Cage" }

      expect(assigns(:movies)).to eq([movie1])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
