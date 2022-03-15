class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    if params[:set_paid] == "true"
      @order.update(is_paid: true)
    end

  end

  def index
    @orders = Order.all
  end


  # def find_order
  #   @order = Order.find(params[:id])
  # end
end
