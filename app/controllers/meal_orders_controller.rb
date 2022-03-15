class MealOrdersController < ApplicationController
  before_action :set_cart, only: [:index, :create]
  # /cart path
  def index
    # @cart = current_user.orders.find_by(is_paid: false)
    @cart_items = @cart.meal_orders
  end

  def new
    @meal_order = MealOrder.new
    @meal = Meal.find(params[:meal_id])
  end

  def create
    @meal_order = MealOrder.new(meal_orders_params)
    @meal = Meal.find(params[:meal_id])
    @meal_order.order = @cart
    @meal_order.meal = @meal

    if @meal_order.save
    redirect_to cart_path, notice: "added to cart"
    else
      render "meals/show"
    end
  end

  # def update

  # end

  # def destroy

  # end

  private

  def meal_orders_params
    params.require(:meal_order).permit(:meal_id, :order_id, :quantity_ordered, :total_price_cents, :pick_up)
  end

  def set_cart
    @cart = current_user.orders.find_or_create_by(is_paid: false)
     # Such a cool method! It will look for an order with 'is_paid' field of false
    # If it does not find one, it will create it for us... otherwise it returns the one it finds
  end
end
