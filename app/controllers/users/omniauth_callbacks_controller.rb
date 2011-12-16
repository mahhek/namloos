class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = TwitterAccount.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Authentication successful."
      redirect_to "/home/dashboard"
    elsif current_user
      current_user.twitter_accounts.create!(:provider => omniauth['provider'], :uid => omniauth['uid'],:secret => omniauth['credentials']['secret'],:token => omniauth['credentials']['token'])
      flash[:notice] = "Authentication successful."
      redirect_to "/home/dashboard"
    end
  end

  def twitter
    redirect_to :action => "twitter_login", :controller => "users/registrations"
  end
end

