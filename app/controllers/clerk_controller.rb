class ClerkController < ApplicationController
  def index
    @menu_items = Menu.active_menus.map { |menu|
      menu.menu_items
    }.flatten
    puts @menu_items
    render "index"
  end
end
