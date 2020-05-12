class Movie < ActiveRecord::Base

    #### Relationships ####
    has_many :users, through: :user_movies
end
