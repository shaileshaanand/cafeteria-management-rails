class CustomerController < ApplicationController
  skip_before_action :ensure_admin_logged_in
  before_action :ensure_customer_logged_in

  def index
    @active_menus = Menu.active_menus.order(name: :ASC)
    render "index"
  end

  def cart
    if current_user.cart_items_count == 0
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
