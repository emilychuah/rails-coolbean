class RenamePickUpColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :meals, :collection_from, :collect_from
    rename_column :meals, :collection_to, :collect_to
  end
end
