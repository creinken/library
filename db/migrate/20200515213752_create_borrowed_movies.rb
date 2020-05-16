class CreateBorrowedMovies < ActiveRecord::Migration
    def change
        create_table :borrowed_movies do |t|
            t.integer :user_id
            t.integer :user_movies_id
            t.integer :movie_id
            t.timestamps null: false
        end
    end
end
