module CartsHelper
  def current_cart
    @cart ||= Cart.from_hash(session["cart_9487"])
  end
end
