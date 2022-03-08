class AddDefaultValuesToBooleans < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :food_safety_certified, :boolean, default: false
    change_column :orders, :is_paid, :boolean, default: false
    change_column :orders, :is_completed, :boolean, default: false
  end
end
