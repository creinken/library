require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        # set application public and views folders and enable sessions
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
    end

    # GET root index
    get "/" do
        erb :index
    end

    helpers do
        def logged_in?(session)
            # take in a session hash and check if user is logged in
            !!session[:user_id]
        end

        def current_user
            # find the current logged in user from User table records
            User.find(session[:user_id])
        end

        def owned_by(user_id)
            # check if the current user's id matches the passed in user id
            user_id == current_user.id
        end

        def list_collection(collection, user)
            # set user to passed in user and type to passed in collection's class as a downcased string of the class name
            @user = user
            @type = collection.first.class.to_s.downcase
            @return_document_chunk = Nokogiri::HTML::DocumentFragment.parse ""
            Nokogiri::HTML::Builder.with(@return_document_chunk) do |doc|
                      doc.ul {
                        collection.each do |item|
                            doc.li {
                                doc.div {
                                    doc.a(href: "/#{@type}s/#{item.id}") {
                                        doc.text("#{item.title}")
                                    }
                                    doc.text(", #{item.release_year}")
                                    if owned_by(@user.id)
                                        doc.form(action: "/#{@type}s/#{item.id}", method: "post") {
                                            doc.input(type: "hidden", name: "_method", value: "delete")
                                            doc.input(type: "submit", name: "delete", id: "#{item.id}", value: "Delete")
                                        }
                                        if @type == "movie"
                                            if current_user.user_movies.find_by(movie_id: item.id).loaned_out == false
                                                doc.form(action: "/#{@type}s/#{item.id}", method: "post") {
                                                    doc.input(type: "hidden", name: "_method", value: "patch")
                                                    doc.input(type: "submit", name: "loaned_out", id: "#{item.id}", value: "Lend Out")
                                                }
                                            else
                                                doc.form(action: "/#{@type}s/#{item.id}", method: "post") {
                                                    doc.input(type: "hidden", name: "_method", value: "patch")
                                                    doc.input(type: "submit", name: "loaned_out", id: "#{item.id}", value: "Returned")
                                                }
                                            end
                                        else
                                            if current_user.user_games.find_by(game_id: item.id).loaned_out == false
                                                doc.form(action: "/#{@type}s/#{item.id}", method: "post") {
                                                    doc.input(type: "hidden", name: "_method", value: "patch")
                                                    doc.input(type: "submit", name: "loaned_out", id: "#{item.id}", value: "Lend Out")
                                                }
                                            else
                                                doc.form(action: "/#{@type}s/#{item.id}", method: "post") {
                                                    doc.input(type: "hidden", name: "_method", value: "patch")
                                                    doc.input(type: "submit", name: "loaned_out", id: "#{item.id}", value: "Returned")
                                                }
                                            end
                                        end
                                    end # end if owned_by block
                                }
                            }
                        end # end collection.each do block
                      }
                end # nokogiri do block
                @return_document_chunk
        end # list_collection method block
    end # helpers do block
end # class block
