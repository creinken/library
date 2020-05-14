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
        @user = User.find_by(id: current_user.id)
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
        redirect "/index"
    end
end
