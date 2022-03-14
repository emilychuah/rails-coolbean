class RemovePriceFromMealsAndMealOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :price
    remove_column :meal_orders, :total_price
  end
end
