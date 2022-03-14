class RemovePriceFromMeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :price
  end
end
