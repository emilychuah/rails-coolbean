class AddPriceToMealOrders < ActiveRecord::Migration[6.1]
  def change
    add_monetize :meal_orders, :total_price, currency: { present: false }
  end
end
