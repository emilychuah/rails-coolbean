class ChangeIsCompletedToIsPickedUp < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :is_completed, :is_picked_up
  end
end
