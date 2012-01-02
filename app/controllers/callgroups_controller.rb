class CallgroupsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @callgroups = Callgroup.all
  end

  def show
    @callgroup = Callgroup.find(params[:id])
  end

  def new
    @callgroup = Callgroup.new
    render :layout =>false
  end

  def edit
    @callgroup = Callgroup.find(params[:id])
  end

  def create
    @callgroup = Callgroup.new(params[:callgroup])

    respond_to do |format|
      if @callgroup.save
        format.js do
          render :js => "window.location='/callgroups'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @callgroup }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def update
    @callgroup = Callgroup.find(params[:id])

    respond_to do |format|
      if @callgroup.update_attributes(params[:callgroup])
        format.js do
          render :js => "window.location='/callgroups'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @callgroup }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def destroy
    @callgroup = Callgroup.find(params[:id])

    if @callgroup.seller_rates.count > 0
      flash[:error] = "Call group cannot be deleted, It has some seller rates against it!"
    else
      @callgroup.destroy
      flash[:notice] = "Call group deleted successfully!"
    end    
    redirect_to callgroups_url
      
  end
end

