class CreateMovies < ActiveRecord::Migration
    def change
        create_table :movies do |t|
            t.string :title
            t.integer :release_year
            t.string :director
            t.integer :user_id
            t.timestamps null: false
        end
    end
end
