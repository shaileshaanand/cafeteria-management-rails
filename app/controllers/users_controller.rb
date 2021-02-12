class UsersController < ApplicationController
  def create
    if ["Customer", "Admin", "Clerk"].include?(params[:role])
      role_lower = params[:role].downcase
    else
      redirect_to admin_users_path
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
    redirect_to admin_users_path
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
end
