class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :authenticate_user!
#  before_filter :authenticate_admin, :except => ["twitter_login"]

  def twitter_login
    redirect_to "/home/dashboard" unless current_user.twitter_accounts.first.blank?
  end

 
end