class CreateGames < ActiveRecord::Migration
    def change
        create_table :games do |t|
            t.string :title
            t.integer :release_year
            t.string :company
            t.string :console
            t.string :genre
            t.timestamps null: false
        end
    end
end
