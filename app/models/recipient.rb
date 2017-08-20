class Recipient < ApplicationRecord
  belongs_to :order

  validates :name, :tel, :address, :email, presence: true
end
