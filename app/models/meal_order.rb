class MealOrder < ApplicationRecord
  belongs_to :meal
  belongs_to :order
  has_many :reviews
end
