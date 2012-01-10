class CountriesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  def index
    @countries =  Country.all :order => 'created_at DESC'
    @country = Country.new
    @regions = Region.all
  end

  def get_countries
    @region = Region.find_by_id(params[:region_id])
    @countries = @region.nil? ? [] : @region.countries
    
    respond_to do |format|
      format.js do
        foo = render_to_string(:partial => '/shared/countries', :locals => { :countries => @countries }).to_json
        render :js => "$('#countries').html(#{foo})"
      end
    end
  end

  def show
    @country = Country.find(params[:id])
  end

  def new    
    @country = Country.new
    @regions = Region.all
    render :layout => false
  end

  def edit
    @regions = Region.all
    @country = Country.find(params[:id])
  end

  def create
    @country = Country.new(params[:country])
    @regions = Region.all
    respond_to do |format|
      if @country.save
        flash[:notice] = "Country created successfully!."
        format.js do
          render :js => "window.location='/countries'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @country }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def update
    @country = Country.find(params[:id])
    @regions = Region.all
    respond_to do |format|
      if @country.update_attributes(params[:country])
        flash[:notice] = "Country updated successfully!"
        format.js do
          render :js => "window.location='/countries'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @country }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def destroy
    @country = Country.find(params[:id])
    if @country.seller_rates.count > 0
      flash[:error] = "Country cannot be deleted, It has some seller rates against it!"
    else
      @country.destroy
      flash[:notice] = "Country is deleted Successfully!"
    end
    redirect_to countries_url
  end

end
