class RemovePayeeFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :orders, column: :payee_id
  end
end
