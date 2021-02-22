class CustomerController < ApplicationController
  def index
    @active_menu = Menu.active_menu
    render "index"
  end

  def cart
    if User.find(1).cart_items_count == 0
      redirect_to "/customer"
    else
      render "cart"
    end
  end

  def orders
    render "orders"
  end
end
