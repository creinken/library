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
        params[:movie_ids].each do |movie_id|
            @checked_movie = Movie.find_by(id: movie_id)
            if !current_user.movies.include?(@checked_movie)
                current_user.movies << @checked_movie
            end
        end unless params[:movie_ids].nil?
        if !params[:movie][:title].empty? && !params[:movie][:release_year].empty? && !params[:movie][:director].empty?
            @movie = Movie.find_by(title: params[:movie][:title])
            if @movie.nil?
                current_user.movies.create(title: params[:movie][:title], release_year: params[:movie][:release_year], director: params[:movie][:director])
            elsif @movie.title == params[:movie][:title] && @movie.release_year == params[:movie][:release_year] && @movie.director == params[:movie][:director]
                current_user.movies << @movie
            end
        end
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
    delete "/movies/:id" do
            current_user.movies.delete(params[:id])
        redirect "/users/#{current_user.id}"
    end
end
