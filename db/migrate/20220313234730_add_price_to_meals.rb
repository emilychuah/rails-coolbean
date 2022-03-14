class AddPriceToMeals < ActiveRecord::Migration[6.1]
  def change
    add_monetize :meals, :price, currency: { present: false }
  end
end
