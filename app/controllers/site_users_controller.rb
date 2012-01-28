class SiteUsersController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :authenticate_admin, :only => ["index"]
    
  def index
    @users = User.all :order => 'created_at DESC'
    @user = User.new
    @groups = Group.all
    
    @customers = Customer.find(:all, :select => "id, company")
    unless @customers.blank?
      @extensions = @customers.first.extensions
    end
  end

  def show    
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @groups = Group.all
    @extensions = Extension.all
  end

  def create
    logout_keeping_session! unless is_admin?
    @user = User.new(params[:user])
    if @user.valid?
      if is_admin?
        @user.update_attribute("confirmed_at",Time.now)
        success = true
      else
        success = @user && @user.save
      end
      
      unless params[:role].blank? && !params[:extensions].blank?
        @user.groups << Group.find(params[:role])
    
        params[:extensions].each do|e|
          extension = Extension.find_by_name(e)
          @user.extensions << extension
        end
      end
      unless params[:customer_id].blank?
        customer = Customer.find(params[:customer_id])
        @user.customer = customer
        @user.save
      end

    end

    respond_to do |format|
      if success && @user.errors.empty?
        flash[:notice] = "User created successfully!."
        format.js do
          render :js => "window.location='/site_users'"
        end
      else
        @extensions = Extension.all
        @groups = Group.all        
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @user }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
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
        flash[:error] = "You don't have access to this user."
        redirect_to "/"
      end
    end
    @customers = Customer.all
    @extensions = @user.customer.nil? ? Customer.first.extensions  : @user.customer.extensions
    
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @user.valid?
        if @user && @user.update_attributes(params[:user])
          unless params[:customer_id].blank?
            customer = Customer.find(params[:customer_id])
            @user.customer = customer
            @user.save
          end
          if !params[:role].blank? && !params[:extensions].blank?
            @user.groups.delete_all
            @user.extensions.delete_all
      
            groups = Group.find(params[:role])
            @user.groups << groups
            
            
            
            params[:extensions].each do|e|
              extension = Extension.find_by_name(e)
              @user.extensions << extension
            end
          end
          flash[:notice] = "User updated successfully!"
          format.js do
            render :js => "window.location='/site_users'"
          end
        else
          @extensions = Extension.all
          @groups = Group.all
          flash[:error] = "User can't be updated. Please try again or later."
          format.js do
            foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @user}).to_json
            render :js => "$('#error_messages').html(#{foo})"
          end
        end
      else
        @extensions = Extension.all
        @groups = Group.all
        flash[:error] = "User can't be updated. Please try again or later."
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @user }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
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
      redirect_to "/site_users"
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