class AddPurchaseDateToUserGames < ActiveRecord::Migration
    def change
        add_column :user_games, :purchase_date, :integer
        add_column :user_games, :loaned_out, :boolean, default: false
    end
end
