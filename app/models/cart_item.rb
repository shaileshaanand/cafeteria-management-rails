class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item

  def cost
    amount * menu_item.price
  end
end
