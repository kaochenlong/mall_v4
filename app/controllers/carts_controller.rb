class CartsController < ApplicationController
  def add
    product_id = params[:id]

    current_cart.add_item(product_id)
    session["cart_9487"] = current_cart.serialize

    redirect_to products_path, notice: "已加至購物車"
  end

  def show
  end

  def destroy
    session["cart_9487"] = nil
    redirect_to products_path, notice: "購物車已清空"
  end
end
