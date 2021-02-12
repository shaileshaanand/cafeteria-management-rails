class MenuItemsController < ApplicationController
  def create
    new_item = MenuItem.new(
      name: params[:name],
      price: params[:price],
      menu_id: params[:menu_id],
      description: params[:description],
    )
    if not new_item.save()
      flash[:error] = new_item.errors.full_messages.join(", ")
    end
    redirect_to admin_home_path
  end

  def destroy
    MenuItem.find(params[:id]).destroy
    redirect_to admin_home_path
  end
end
