class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    home_path = "/home"
    respond_to?(home_path, true) ? send(root_path) : home_path
  end

  helper_method :is_admin?

  def is_admin?
    admin = Group.find_by_name("Administrator")
    current_user.groups.include?(admin)
  end

  def authenticate_admin
    redirect_to "/" unless is_admin?
  end

#  protected

#  def current_user
#    @current_user ||= User.find_by_id(session[:user_id])
#  end
#
#  def require_login
#    redirect_to '/' if current_user.nil?
#  end
#
#  def require_admin
#    redirect_to '/' unless current_user.try(:admin?)
#  end

end