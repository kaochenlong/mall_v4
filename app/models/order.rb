class Order < ApplicationRecord
  has_one :recipient
  has_many :order_items
end
