class PaymentsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @order.meal_orders.map{|meal_order| meal_order.stripe_line_item},
      success_url: order_url(@order, set_paid: true),
      cancel_url: cart_url
    )

    @order.update(checkout_session_id: session.id)
  end
end
