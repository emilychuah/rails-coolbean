class AddIsCompletedToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :is_completed, :boolean
  end
end
