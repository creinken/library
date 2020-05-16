class CreateBorrowedGames < ActiveRecord::Migration
  def change
      create_table :borrowed_games do |t|
          t.integer :user_id
          t.integer :user_games_id
          t.integer :game_id
          t.timestamps null: false
      end
  end
end
