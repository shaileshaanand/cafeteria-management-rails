# require "date"

class OrdersController < ApplicationController
  def create
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
        )
      }
      User.find(params[:user_id]).cart_items.delete_all
    else
      flash[:error] = new_order.errors.full_messages.join(", ")
    end
    redirect_to "/customer/orders"
  end
end