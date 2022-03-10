class MealOrdersController < ApplicationController

  # /cart path
  def index
    # Such a cool method! It will look for an order with 'is_paid' field of false
    # If it does not find one, it will create it for us... otherwise it returns the one it finds
    @cart = current_user.orders.find_or_create_by(is_paid: false)
    # @cart = current_user.orders.find_by(is_paid: false)
    @cart_items = @cart.meal_orders
  end

  def create

  end

  def update

  end

  def destroy

  end
end
