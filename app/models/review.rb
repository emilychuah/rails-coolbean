class Review < ApplicationRecord
  belongs_to :meal_order

  validates :content, :rating, presence: true
end
