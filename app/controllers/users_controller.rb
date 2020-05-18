class UsersController < ApplicationController

    # GET: /users
    get "/users" do
        erb :"/users/index"
    end

    # GET: /users/new
    get "/signup" do
        erb :"/users/new"
    end

    # POST: /signup
    post "/signup" do
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
            redirect '/signup'
        elsif User.find_by(username: params[:usernam]) || User.find_by(email: params[:email])
            redirect '/error'
        else
            @user = User.new(username: params[:username], email: params[:email], password: params[:password])
            if @user.save
                session[:user_id] = @user.id
                redirect "/users/#{@user.id}"
            else
                redirect '/signup'
            end
        end
    end

    # GET: /login
    get '/login' do
        if logged_in?(session)
            redirect "/users/#{current_user.id}"
        else
            erb :'users/login'
        end
    end

    # POST: /login
    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{current_user.id}"
        else
            redirect "/login"
        end
    end

    # GET: /logout
    get '/logout' do
        if logged_in?(session)
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end

    # GET: /users/5
    get "/users/:id" do
        @user = User.find(params[:id].to_i)
        @movies = @user.movies
        @user_movies = @user.user_movies
        @games = @user.games
        @user_games = @user.user_games
        # binding.pry
        erb :"/users/show"
    end

    # GET: /users/5/edit
    get "/users/:id/edit" do
        erb :"/users/edit"
    end

    # PATCH: /users/5
    patch "/users/:id" do
        current_user.update(params[:user])
        redirect "/users/#{current_user.id}"
    end

    # DELETE: /users/5/delete
    delete "/users/:id" do
        current_user.delete
        session.clear
        redirect "/"
    end

    # GET: /error
    get '/error' do
        erb :"/users/error"
    end
end
