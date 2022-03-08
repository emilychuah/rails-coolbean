class AddDefaultValueToOverallRating < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :overall_rating, :float, :default => 0
  end
end
