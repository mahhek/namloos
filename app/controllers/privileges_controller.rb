class PrivilegesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  def index
    @privileges = Privilege.all:order => 'created_at DESC'
    @privilege = Privilege.new
  end

  def show
    @privilege = Privilege.find(params[:id])
  end

  def new
    @privilege = Privilege.new
    render :layout => false
  end

  def edit
    @privilege = Privilege.find(params[:id])
  end

  def create
    @privilege = Privilege.new(params[:privilege])

    respond_to do |format|
      if @privilege.save
        format.js do
          render :js => "window.location='/privileges'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @privilege }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def update
    @privilege = Privilege.find(params[:id])
    respond_to do |format|
      if @privilege.update_attributes(params[:privilege])
        format.js do
          render :js => "window.location='/privileges'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @privilege }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def destroy
    @privilege = Privilege.find(params[:id])
    @privilege.destroy
    flash[:notice] = "Privilege deleted successfully!"
    redirect_to privileges_url

  end
end

