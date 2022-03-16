class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    if params[:set_paid] == "true"
      @order.update(is_paid: true)
    end

    @markers = @order.meals.geocoded.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude,
        info_window: render_to_string(partial: "meals/info_window", locals: { meal: meal }),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  def index
    @orders = Order.all

  end


  # def find_order
  #   @order = Order.find(params[:id])
  # end
end
