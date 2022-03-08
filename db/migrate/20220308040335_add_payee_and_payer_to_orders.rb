class AddPayeeAndPayerToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :payee, foreign_key: { to_table: :users }
    add_reference :orders, :payer, foreign_key: { to_table: :users }
  end
end
