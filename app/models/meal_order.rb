class MealOrder < ApplicationRecord
  belongs_to :meal
  belongs_to :order
  has_many :reviews, dependent: :destroy

  validates :quantity_ordered, :total_price, :pick_up, presence: true
end
