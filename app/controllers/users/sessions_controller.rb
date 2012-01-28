class Users::SessionsController < Devise::SessionsController

  layout 'login'

  def new
    redirect_to "/home" if user_signed_in?
  end
  

end