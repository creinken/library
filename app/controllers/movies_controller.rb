class MoviesController < ApplicationController

  # GET: /movies
  get "/movies" do
    erb :"/movies/index"
  end

  # GET: /movies/new
  get "/movies/new" do
    @movies = Movie.all
    erb :"/movies/new"
  end

  # POST: /movies
  post "/movies" do
    redirect "/users/#{current_user.id}"
  end

  # GET: /movies/5
  get "/movies/:id" do
    erb :"/movies/show"
  end

  # GET: /movies/5/edit
  get "/movies/:id/edit" do
    erb :"/movies/edit"
  end

  # PATCH: /movies/5
  patch "/movies/:id" do
    redirect "/movies/:id"
  end

  # DELETE: /movies/5/delete
  delete "/movies/:id/delete" do
    redirect "/movies"
  end
end
