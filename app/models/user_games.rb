class UserGame < ActiveRecord::Base

    #### Relationships ####
    belongs_to :user
    belongs_to :game

end
