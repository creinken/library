class AddPurchaseDateToUserMovies < ActiveRecord::Migration
    def change
        add_column :user_movies, :purchase_date, :integer
        add_column :user_movies, :loaned_out, :boolean
    end
end
