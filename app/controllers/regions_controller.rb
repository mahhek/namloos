class RegionsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @regions = Region.all :order => 'created_at DESC'
    @region = Region.new
  end
  
  def show
    @region = Region.find(params[:id])
  end

  def new
    @region = Region.new
    render :layout => false
  end

  def edit
    @region = Region.find(params[:id])
  end

  def create
    @region = Region.new(params[:region])

    respond_to do |format|
      if @region.save
        format.js do
          render :js => "window.location='/regions'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @region }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def update
    @region = Region.find(params[:id])

    respond_to do |format|
      if @region.update_attributes(params[:region])
        format.js do
          render :js => "window.location='/regions'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @region }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def destroy
    @region = Region.find(params[:id])
    if @region.seller_rates.count > 0
      flash[:error] = "Region cannot be deleted, It has some seller rates against it!"
    else
      @region.destroy
      flash[:notice] = "Region deleted successfully!"
    end
    redirect_to regions_url

  end
end

