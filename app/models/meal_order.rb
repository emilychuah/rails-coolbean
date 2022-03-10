class MealOrder < ApplicationRecord
  belongs_to :meal
  belongs_to :order
  has_many :reviews, dependent: :destroy

  validates :quantity_ordered, :total_price, :pick_up, presence: true
  before_validation :calculate_total

  private

  def calculate_total
    self.total_price = meal.price * quantity_ordered
  end
end
