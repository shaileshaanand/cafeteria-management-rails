class CartItemsController < ApplicationController
  skip_before_action :ensure_admin_logged_in
  before_action :ensure_customer_or_clerk_logged_in

  def add
    if params[:user_id].to_i == User.walk_in_customer.id
      ensure_clerk_logged_in
    else
      if params[:user_id].to_i != current_user.id
        redirect_to "/"
        return
      end
    end

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
    if params[:source] == "clerk"
      redirect_to "/clerk"
    else
      redirect_to "/"
    end
  end

  def get_cart_item(id)
    cart_item = CartItem.find(params[:id])
    if cart_item.user_id == User.walk_in_customer.id
      ensure_clerk_logged_in
    else
      cart_item = current_user.cart_items.find(params[:id])
    end
    cart_item
  end

  def update
    cart_item = get_cart_item(params[:id])
    if params[:amount].to_i > 0
      cart_item.amount = params[:amount]
      cart_item.save!()
    end
    redirect_to "/cart"
  end

  def destroy
    cart_item = get_cart_item(params[:id])
    cart_item.destroy
    if params[:source] == "clerk"
      redirect_to "/clerk"
    else
      redirect_to "/cart"
    end
  end
end
