class Order < ApplicationRecord
  belongs_to :user
  has_many :meal_orders, dependent: :destroy
  has_many :meals, through: :meal_orders

  monetize :amount_cents

  def total
    meal_orders.sum{ |meal_order| meal_order.total_price }
  end
end
