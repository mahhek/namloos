class Users::SessionsController < Devise::SessionsController

  def new
#    p "aaaaaaaaaaaaaaaa",current_user
#    asda
    redirect_to "/home" if user_signed_in?
  end

end