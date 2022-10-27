class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]

  # Home page
  def home
    @meals = Meal.all
  end

  # Search results with map page
  def index # rubocop:disable Metrics/MethodLength
    if params[:query].present?
      @meals = Meal.search_by_address(params[:query])
    else
      @meals = Meal.all
    end
    @meals = @meals.page params[:page]

    @markers = @meals.geocoded.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { meal: meal }),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  # Specific meal page
  def show
    @meal = Meal.find(params[:id])
    @meal_order = MealOrder.new
    @review = Review.new(meal: @meal)
  end

  def new
    @meal = Meal.new
  end

  def create
    params[:meal][:tag_list] = params[:meal][:tag_list].join(',') if params[:meal] && params[:meal][:tag_list]
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save!
      redirect_to meals_path
    else
      flash[:alert] = "Oops! Something went wrong."
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:address, :tag_list, :name, :description, :cuisine, :price, :available_quantity,
                                 :available_quantity, :collect_from, :collect_to, photos: [])
  end
end
