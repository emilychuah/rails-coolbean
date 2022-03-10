class AddAddressToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :address, :string
  end
end
