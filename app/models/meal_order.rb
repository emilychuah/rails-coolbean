class MealOrder < ApplicationRecord
  belongs_to :meal
  belongs_to :order

  monetize :total_price_cents

  validates :quantity_ordered, presence: true
  before_validation :calculate_total

  def stripe_line_item
    {
      name: meal.name,
      images: meal.photos.attached? ? [meal.photos.first.url] : [meal.picture_url],
      amount: meal.price_cents,
      currency: 'aud',
      quantity: quantity_ordered
    }
  end

  private

  def calculate_total
    self.total_price = meal.price * quantity_ordered
  end

  def update_quantity
    @meal_order.update_attribute(:quantity_ordered)
  end
end
