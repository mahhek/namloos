class SiteUsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin, :only => ["index"]
    
  def index
    @users = User.all
  end

  def show    
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @groups = Group.all
  end

  def create
    logout_keeping_session! unless is_admin?
    @user = User.new(params[:user])
    if is_admin?
      @user.update_attribute("confirmed_at",Time.now)
      success = true
    else
      success = @user && @user.save
    end
    @user.groups << Group.find(params[:role])
    if success && @user.errors.empty?
      redirect_to('/')
      flash[:notice] = "User created successfully"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again."
      render :action => 'new'
    end
  end

  def edit
    @groups = Group.all
    if is_admin?
      @user = User.find(params[:id])
    else      
      if params[:id].to_i == current_user.id.to_i        
        @user = User.find(params[:id])
      else
        flash[:notice] = "You don't have access to this user."
        redirect_to "/"
      end
    end
  end

  def update    
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user && @user.update_attributes(params[:user])
      @user.groups.delete_all
      
      group = Group.find(params[:role])
      @user.groups << group
      
      flash[:notice] = "User updated successfully!"
      redirect_to "/site_users"
    else
      flash[:notice] = "User can't be updated. Please try again or later."
      render :action => "edit"
    end
  end

  def destroy
    user = User.find(params[:id])
    unless user.blank?
      if user.delete
        flash[:notice] = "User deleted Successfully!"
      else
        flash[:error] = "User can't be deleted please try again or later!"
      end
      redirect_to "/users"
    end
  end

  def assign_privileges
    @user = User.find(params[:id])
    @privileges = Privilege.all
  end

  def user_privileges
    user = User.find(params[:id])
    user.privileges.delete_all
    params[:privileges].each do|p|
      privilege = Privilege.find_by_name(p)
      user.privileges << privilege
    end
    flash[:notice] = "Privileges Assigned successfully!"
    redirect_to "/site_users/assign_privileges/#{user.id}"
  end

end