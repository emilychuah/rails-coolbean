class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def show
    @meal = Meal.find(params[:id])
  end
end
