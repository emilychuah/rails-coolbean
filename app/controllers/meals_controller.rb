class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def show
    @meal = Meal.find(params[:id])
    @meal_order = MealOrder.new
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user


    if @meal.save!
      redirect_to meals_path
    else
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :cuisine, :price, :available_quantity, :available_quantity, :collection_from, :collection_to, photos: [])
  end

  def order_params
    params.require(:order).permit(:user_id, :is_paid, :is_picked_up)
  end
end
