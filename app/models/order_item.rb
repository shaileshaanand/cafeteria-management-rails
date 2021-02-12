class OrderItem < ApplicationRecord
  belongs_to :order
  has_one :menu_item
end
