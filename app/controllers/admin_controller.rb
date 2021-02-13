class AdminController < ApplicationController
  def index
    puts Menu.all
    @menus = Menu.all
    render "index"
  end
end
