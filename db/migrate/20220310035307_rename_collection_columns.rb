class RenameCollectionColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :meals, :collection_from, :pick_up_from
    rename_column :meals, :collection_to, :pick_up_to
  end
end
