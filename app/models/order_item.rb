class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  def total
    amount * cost
  end
end
