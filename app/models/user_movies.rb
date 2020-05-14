class UserMovie < ActiveRecord::Base

    #### Relationships ####
    belongs_to :user
    belongs_to :movie

end
