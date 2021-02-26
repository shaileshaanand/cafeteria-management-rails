class CustomerController < ApplicationController
  def index
    @active_menus = Menu.active_menus.order(name: :ASC)
    render "index"
  end

  def cart
    if User.find(1).cart_items_count == 0
      redirect_to "/"
    else
      render "cart"
    end
  end

  def orders
    render "orders"
  end

  def reports
    render "reports"
  end
end
