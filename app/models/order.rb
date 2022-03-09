class Order < ApplicationRecord
  belongs_to :user

  has_many :meal_orders, dependent: :destroy
end
