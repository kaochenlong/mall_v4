class OrdersController < ApplicationController
  def create

    # 成立訂單
    order = Order.new
    current_cart.items.each do |item|
      order.order_items.build(product: item.product, quantity: item.quantity)
    end

    order.build_recipient(orders_params[:recipient])
    order.save

    # 刷卡
    #if 刷卡成功
      #order.pay!
    #end

    # 通知
    # 清空購物車

    redirect_to products_path, notice: "感謝大爺!"
  end

  private
  def orders_params
    params.require(:order).permit(recipient: [:name, :tel, :address, :email])
  end
end
