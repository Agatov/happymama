class OrdersController < ApplicationController
  def create
    order = Order.new order_params
    order.save
    OrderMailer.new_order(order).deliver_now

    cc = CalltouchClient.new('137753270ct2df3f0819b55ad9bf6838860cc1794a4')
    cc.set_order(
      subject: "Новая заявка на #{order.workshop.name}", 
      orderStatus: 'ACCEPTED', 
      fio: order.username, 
      phoneNumber: order.phone,
      session_id: params[:order][:session_id]
      )

    render json: {status: :ok}
  end

  private

  def order_params
    params.require(:order).permit(:username, :phone, :workshop_id)
  end
end