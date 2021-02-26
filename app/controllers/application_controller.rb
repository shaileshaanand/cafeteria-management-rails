class ApplicationController < ActionController::Base
  before_action :ensure_admin_logged_in

  def ensure_admin_logged_in
    unless current_user && current_user.admin?
      redirect_to new_session_path
    end
  end

  def ensure_clerk_logged_in
    unless current_user && current_user.clerk?
      redirect_to new_session_path
    end
  end

  def ensure_customer_logged_in
    unless current_user && current_user.customer?
      redirect_to new_session_path
    end
  end

  def ensure_customer_or_clerk_logged_in
    unless current_user && (current_user.customer? || current_user.clerk?)
      redirect_to new_session_path
    end
  end

  def ensure_any_logged_in
    unless current_user
      redirect_to new_session_path
    end
  end

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
