class CreateMealOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_orders do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity_ordered
      t.datetime :pick_up

      t.timestamps
    end
  end
end
