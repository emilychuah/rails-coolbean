class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_orders, dependent: :destroy
  has_many :orders, through: :meal_orders, dependent: :destroy
  has_many_attached :photos

  validates :name, :price, :description, :collect_from, :collect_to, :available_quantity, :cuisine, presence: true
  validates :available_quantity, numericality: { only_integer: true }

  # validates_date :collect_from, on_or_after: lambda { Date.current }
  # validates_date :collect_to, on_or_after: lambda { :collect_from }
  # validate :collect_from_cannot_be_in_the_past

  private

  # def collect_from_cannot_be_in_the_past
  #   if collect_from.present? && collect_from < Date.today
  #     errors.add(:collect_from, "can't be in the past")
  #   end
  # end
end
