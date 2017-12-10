class OrdersController < ApplicationController

  def create
    offer = Offer.find(params[:offer_id])

    order = Order.create!(offer_sku: offer.sku, amount: offer.price, state: 'pending', user_id: current_user.id)

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

end
