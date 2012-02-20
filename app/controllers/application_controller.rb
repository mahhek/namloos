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

  def get_date_range(caption)
    case caption
    when "this_month"
      return [Date.today.beginning_of_month, Date.today.end_of_month]
    when "last_month"
      return [(Date.today - 1.month).beginning_of_month, (Date.today).beginning_of_month]
    when "this_quarter"
      return [Date.today.beginning_of_quarter, Date.today.end_of_quarter]
    when "last_quarter"
      return [(Date.today - 3.months).beginning_of_quarter, (Date.today - 3.months).end_of_quarter + 1.day]
    when "this_year"
      return [Date.new(Date.today.year,1).to_date,Date.new(Date.today.year,12,31).to_date]
    when "last_year"
      return [Date.new(Date.today.year - 1,1).to_date,Date.new(Date.today.year,1,1).to_date]
    end
  end
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