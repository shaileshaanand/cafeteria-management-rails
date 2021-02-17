class CustomerController < ApplicationController
  def index
    @active_menu = Menu.active_menu
    render "index"
  end

  def cart
    render "cart"
  end

  def orders
    render "orders"
  end
end
