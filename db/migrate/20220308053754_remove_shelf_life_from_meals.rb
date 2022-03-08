class RemoveShelfLifeFromMeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :shelf_life_end
  end
end
