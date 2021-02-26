class UsersController < ApplicationController
  skip_before_action :ensure_admin_logged_in, only: [:new, :create]

  def new
    render "signup"
  end

  def create
    if current_user && current_user.admin?
      if ["Customer", "Admin", "Clerk"].include?(params[:role])
        role_lower = params[:role].downcase
      else
        redirect_to admin_users_path
      end
    else
      role_lower = "customer"
    end
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: role_lower,
    )
    if not new_user.save()
      flash[:error] = new_user.errors.full_messages.join(", ")
    end
    if params[:source] == "admin"
      redirect_to admin_users_path
    else
      redirect_to customer_home_path
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
end
