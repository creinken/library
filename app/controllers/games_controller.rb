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
          @game = Game.find_by(title: params[:game][:title], release_year: params[:game][:release_year])
          if @game.nil?
              current_user.games.create(params[:game])
          else
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

  # PATCH: /games/5
  patch "/games/:id" do
      current_user.user_games.find_by(game_id: params[:id]).update(loaned_out: !current_user.user_games.find_by(game_id: params[:id]).loaned_out)
      redirect "/users/#{current_user.id}"
  end

  # DELETE: /games/5/delete
  delete "/games/:id" do
          current_user.games.delete(params[:id])
      redirect "/users/#{current_user.id}"
  end
end
