class BraintreeService
  attr_reader :nonce, :amount

  def initialize(nonce, amount)
    @nonce = nonce
    @amount = amount
  end

  def run
    Braintree::Transaction.sale(
      :amount => amount,
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )
  end
end

