class GamesController < ApplicationController

  # GET: /games
  get "/games" do
      erb :"/games/index"
  end

  # GET: /games/new
  get "/games/new" do
      @games = Game.all
      erb :"/games/new"
  end

  # POST: /games
  post "/games" do
      params[:game_ids].each do |game_id|
          @checked_game = Game.find_by(id: game_id)
          if !current_user.games.include?(@checked_game)
              current_user.games << @checked_game
          end
      end unless params[:game_ids].nil?
      if !params[:game][:title].empty? && !params[:game][:release_year].empty? && !params[:game][:company].empty?
          @game = Game.find_by(title: params[:game][:title])
          if @game.nil?
              current_user.games.create(title: params[:movie][:title], release_year: params[:game][:release_year], company: params[:game][:company])
          elsif @game.title == params[:movie][:title] && @game.release_year == params[:game][:release_year] && @game.company == params[:game][:company]
              current_user.games << @game
          end
      end
      redirect "/users/#{current_user.id}"
  end

  # GET: /games/5
  get "/games/:id" do
      @game = Game.find(params[:id])
      erb :"/games/show"
  end

  # GET: /games/5/edit
  get "/games/:id/edit" do
      @game = current_user.games.find_by(id: params[:id])
      erb :"/games/edit"
  end

  # PATCH: /games/5
  patch "/games/:id" do
      @game = current_user.games.find_by(id: params[:id])
      current_user.games.delete(params[:id])
      current_user.games.create(params[:game])
      redirect "/users/#{current_user.id}"
  end

  # DELETE: /games/5/delete
  delete "/games/:id" do
          current_user.games.delete(params[:id])
      redirect "/users/#{current_user.id}"
  end
end
