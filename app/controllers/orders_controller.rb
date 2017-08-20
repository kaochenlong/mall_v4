class OrdersController < ApplicationController
  def create
    # 成立訂單
    # 刷卡
    # 通知
    # 清空購物車

    redirect_to products_path, notice: "感謝大爺!"
  end
end
