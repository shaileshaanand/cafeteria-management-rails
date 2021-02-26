class ClerkController < ApplicationController
  skip_before_action :ensure_admin_logged_in
  before_action :ensure_clerk_logged_in

  def index
    @menu_items = Menu.active_menus.map { |menu|
      menu.menu_items
    }.flatten
    puts @menu_items
    render "index"
  end
end
