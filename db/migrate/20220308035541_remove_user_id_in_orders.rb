class RemoveUserIdInOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :user_id
  end
end
