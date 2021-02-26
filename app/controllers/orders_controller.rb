class OrdersController < ApplicationController
  skip_before_action :ensure_admin_logged_in
  before_action :ensure_customer_or_clerk_logged_in, only: [:create]
  before_action :ensure_any_logged_in, only: [:show]

  def create
    if params[:user_id].to_i == User.walk_in_customer.id
      puts "CLERKKKK"
      ensure_clerk_logged_in
    end
    new_order = Order.new(
      user_id: params[:user_id],
      date: DateTime.now,
      status: false,
      amount: User.find(params[:user_id]).cart_total,
    )
    if new_order.save()
      User.find(params[:user_id]).cart_items.map { |cart_item|
        OrderItem.create(
          order_id: new_order.id,
          menu_item_id: cart_item.menu_item.id,
          amount: cart_item.amount,
          cost: cart_item.menu_item.price,
        )
      }
      User.find(params[:user_id]).cart_items.delete_all
    else
      flash[:error] = new_order.errors.full_messages.join(", ")
    end
    if params[:source] == "clerk"
      redirect_to "/clerk"
    else
      redirect_to "/orders"
    end
  end

  def deliver
    Order.find(params[:order_id]).update({ :status => true })
    redirect_to "/clerk"
  end

  def show
    if @current_user.admin?
      @order = Order.find(params[:id])
    else
      @order = @current_user.orders.find(params[:id])
    end
    render "index"
  end
end
