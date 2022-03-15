class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @meals = User.meals.all
  end
end
