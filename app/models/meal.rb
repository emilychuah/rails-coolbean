class Meal < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :meal_orders

  validates :name, :price, :description, :collection_from, :collection_to, :available_quantity, :cuisine, presence: true
  validates :price, :available_quantity, numericality: { only_integer: true }

  validates_date :collection_from, on_or_after: lambda { Date.current }
  validates_date :collection_to, on_or_after: lambda { :collection_from }
  validate :collection_from_cannot_be_in_the_past

  private

  def collection_from_cannot_be_in_the_past
    if collection_from.present? && collection_from < Date.today
      errors.add(:collection_from, "can't be in the past")
    end
  end
end
