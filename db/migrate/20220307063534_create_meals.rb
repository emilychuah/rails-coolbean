class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.float :price
      t.text :description
      t.datetime :shelf_life_end
      t.datetime :collection_from
      t.datetime :collection_to
      t.integer :available_quantity
      t.string :cuisine

      t.timestamps
    end
  end
end
