class MenusController < ApplicationController
  def create
    new_menu = Menu.new(
      name: params[:name],
    )
    if not new_menu.save()
      flash[:error] = new_menu.errors.full_messages.join(", ")
    end
    redirect_to admin_home_path
  end

  def destroy
    Menu.find(params[:id]).destroy
    redirect_to admin_home_path
  end
end
