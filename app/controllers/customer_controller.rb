class CustomerController < ApplicationController
  def index
    @active_menu = Menu.active_menu
    render "index"
  end
end
