class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  # Home page
  def home
    @meals = Meal.all
  end

  # Search results with map page
  def index
    if params[:query].present?
      @users = User.search_by_address(params[:query])
      @meals = []
      @users.each do |user|
        @meals += user.meals
      end
    else
      @meals = Meal.all
    end

    @users = User.all

    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  # Specific meal page
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
    params.require(:meal).permit(:name, :description, :cuisine, :price, :available_quantity, :available_quantity, :collect_from, :collect_to, photos: [])
  end
end
