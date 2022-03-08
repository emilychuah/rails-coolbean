class Order < ApplicationRecord
  belongs_to :payee, class_name: "User"
  belongs_to :payer, class_name: "User"

  has_many :meals
  has_many :meal_orders
end
