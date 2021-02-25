class AdminController < ApplicationController
  def index
    puts Menu.all
    @menus = Menu.all.order(name: :ASC)
    render "index"
  end

  def report_by_date
    @heading = "Orders between #{params[:start_date]} - #{params[:end_date]}"
    @orders = Order.between(params[:start_date], params[:end_date])
    @total = @orders.map { |order| order.amount }.reduce(0, :+)
    render "report"
  end

  def report_by_user
    user = User.find_by(email: params[:email])
    @heading = "Orders By #{user.first_name}, #{user.email}"
    @orders = user.orders
    @total = @orders.map { |order| order.amount }.reduce(0, :+)
    render "report"
  end
end
