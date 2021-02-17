class CartItemsController < ApplicationController
  def add
    if CartItem.exists?(user_id: params[:user_id], menu_item_id: params[:menu_item_id])
      puts "found"
      cart_item = CartItem.find_by(user_id: params[:user_id], menu_item_id: params[:menu_item_id])
      cart_item.amount += params[:amount].to_i
      cart_item.save!()
    else
      new_cart_item = CartItem.new(
        user_id: params[:user_id],
        menu_item_id: params[:menu_item_id],
        amount: params[:amount],
      )
      if not new_cart_item.save()
        flash[:error] = new_cart_item.errors.full_messages.join(", ")
      end
    end
    redirect_to "/customer"
  end

  def update
    cart_item = CartItem.find(params[:id])
    if params[:amount].to_i >= 0
      cart_item.amount = params[:amount]
      cart_item.save!()
    end
    redirect_to "/customer/cart"
  end
end
