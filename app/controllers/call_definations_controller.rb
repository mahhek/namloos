class CallDefinationsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!


  def index
    @call_definations = CallDefination.all
    @call_defination = CallDefination.new
  end
  
  def show
    @call_defination = CallDefination.find(params[:id])
  end
  
  def new
    @call_defination = CallDefination.new
    render :layout => false
  end
  
  def edit
    @call_defination = CallDefination.find(params[:id])
  end

  def create
    @call_defination = CallDefination.new(params[:call_defination])
    respond_to do |format|
      if @call_defination.save
        format.js do
          render :js => "window.location='/call_definations'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @call_defination}).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def update
    @call_defination = CallDefination.find(params[:id])
    
    respond_to do |format|
      if @call_defination.update_attributes(params[:call_defination])
        format.js do
          render :js => "window.location='/call_definations'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @call_defination }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def destroy
    @call_defination = CallDefination.find(params[:id])
    if @call_defination.seller_rates.count > 0
      flash[:error] = "Call definition cannot be deleted, It has some seller rates against it!"
    else
      @call_defination.destroy
      flash[:notice] = "Call definition deleted successfully!"
    end 
    redirect_to call_definations_url
      
  end
end

