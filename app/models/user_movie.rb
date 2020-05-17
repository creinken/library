class UserMovie < ActiveRecord::Base

    #### Relationships ####
    belongs_to :user
    belongs_to :movie
    # has_many :borrowed_movies
    # has_many :users, through: :borrowed_movies

end
