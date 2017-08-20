class Order < ApplicationRecord
  has_one :recipient
  has_many :order_items

  include AASM

  aasm column: "state" do
    state :pending, :initial => true
    state :paid, :shipped, :delivered, :cancelled, :refunded

    event :pay do
      transitions :from => :pending, :to => :paid
    end

    event :ship do
      transitions :from => :paid, :to => :shipped

      after_transaction do
        puts "發簡訊通知!"
      end
    end

    event :deliver do
      transitions :from => :shipped, :to => :delivered
    end

    event :cancel do
      transitions :from => [:paid, :delivered], :to => :cancelled
    end

    event :refund do
      transitions :from => :cancelled, :to => :refunded
    end
  end
end
