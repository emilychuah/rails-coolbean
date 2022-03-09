class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order
  end

  def index
    @orders = Order.all
  end
  # private

  # def find_order
  #   @order = Order.find(params[:id])
  # end
end
