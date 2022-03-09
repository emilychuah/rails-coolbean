class RemovePayerFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :orders, column: :payer_id
  end
end
