class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :name, :string
    add_column :users, :overall_rating, :float
    add_column :users, :food_safety_certified, :boolean
  end
end
