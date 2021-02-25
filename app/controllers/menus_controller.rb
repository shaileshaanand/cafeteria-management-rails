class MenusController < ApplicationController
  def create
    new_menu = Menu.new(
      name: params[:name],
      active: false,
    )
    if not new_menu.save()
      flash[:error] = new_menu.errors.full_messages.join(", ")
    end
    if Config.active_menu_id == nil
      Config.set_active_menu(new_menu.id)
    end
    redirect_to admin_home_path
  end

  def update
    menu = Menu.find(params[:id])
    if not params[:active].nil?
      menu.active = params[:active]
      menu.save
      redirect_to "/admin"
    end
  end

  def destroy
    Menu.find(params[:id]).destroy
    redirect_to admin_home_path
  end
end
