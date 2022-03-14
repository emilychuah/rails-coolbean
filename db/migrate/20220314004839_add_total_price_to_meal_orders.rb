class AddTotalPriceToMealOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_orders, :total_price, :integer
  end
end
