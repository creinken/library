class BorroedGame < ActiveRecord::Base

    #### Relationships ####
    belongs_to :user
    belongs_to :user_game

end
