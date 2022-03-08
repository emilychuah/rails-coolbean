class Order < ApplicationRecord
  belongs_to :user
  has_many :meals
  has_many :meal_orders
end
