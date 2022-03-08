class MealOrder < ApplicationRecord
  belongs_to :meal
  belongs_to :order
  has_many :reviews

  validates :quantity_ordered, :total_price, :pick_up, presence: true
end
