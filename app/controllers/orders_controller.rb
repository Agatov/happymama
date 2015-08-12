class OrdersController < ApplicationController
  def create
    order = Order.new order_params
    order.save
    render json: {status: :ok}
  end

  private

  def order_params
    params.require(:order).permit(:username, :phone)
  end
end