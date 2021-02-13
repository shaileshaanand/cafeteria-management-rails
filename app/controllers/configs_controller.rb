class ConfigsController < ApplicationController
  def set_active_menu
    Config.set_active_menu(params[:menu_id])
    redirect_to "/admin"
  end
end
