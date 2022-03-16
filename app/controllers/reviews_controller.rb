class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @meal = Meal.find(params[:meal_id])
    @review.meal = @meal
    if @review.save
      redirect_to meal_path(@meal, anchor: "review-#{@review.id}")
    else
      render 'meals/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to meal_path(@review.meal)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
