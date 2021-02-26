class SessionsController < ApplicationController
  skip_before_action :ensure_admin_logged_in

  def new
    if current_user
      if current_user.admin?
        redirect_to admin_home_path
      elsif current_user.customer?
        redirect_to customer_home_path
      elsif current_user.clerk?
        redirect_to clerk_home_path
      end
    else
      render "new"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
    else
      flash[:error] = "Invalid Email or Password"
    end
    redirect_to new_session_path
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to new_session_path
  end
end
