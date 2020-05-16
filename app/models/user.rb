class User < ActiveRecord::Base

    #### Relationships ####
    has_secure_password
    has_many :user_movies
    has_many :movies, through: :user_movies
    has_many :user_games
    has_many :games, through: :user_games
    has_many :borrowed_movies
    has_many :user_movies, through: :borrowed_movies
    has_many :borrowed_games
    has_many :user_games, through: :borrowed_games



    #### Instance Methods ####
    def slug
        "#{self.username.gsub(/\s/,'-')}"
    end


    #### Class Methods ####
    def self.find_by_slug(comparison)
        @user = nil
        self.all.each do |user|
            if user.slug == comparison
                @user = user
            end
        end
        @user
    end
end
