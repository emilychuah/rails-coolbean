class Order < ApplicationRecord
  belongs_to :user

  has_many :meal_orders, dependent: :destroy
  has_many :meals, through: :meal_orders
end
