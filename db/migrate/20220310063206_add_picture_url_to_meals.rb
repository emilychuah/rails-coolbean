class AddPictureUrlToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :picture_url, :string
  end
end
