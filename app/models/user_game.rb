class UserGame < ActiveRecord::Base

    #### Relationships ####
    belongs_to :user
    belongs_to :game
    has_many :borrowed_games
    has_many :users, through: :borrowed_games

end
