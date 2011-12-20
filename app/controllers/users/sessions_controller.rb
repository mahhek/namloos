class Users::SessionsController < Devise::SessionsController
  

  def new
    redirect_to "/home" if user_signed_in?
  end

end