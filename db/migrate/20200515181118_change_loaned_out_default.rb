class ChangeLoanedOutDefault < ActiveRecord::Migration
    def change
        change_column_default(:user_movies, :loaned_out, false)
    end
end
