class Meal < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :meal_orders
end
