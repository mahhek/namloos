class CountriesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def edit
    @country = Country.find(params[:id])
  end

  def create
    @country = Country.new(params[:country])
    if @country.save
      redirect_to :action => "index", :notice => 'Country was successfully created.'
    else
      render :update do |page|
        page["error_messages"].replace_html :partial => "/shared/error_messages", :locals => { :object => @country }
      end      
    end        
  end

  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(params[:country])
      redirect_to :action => "index", :notice => 'Country was successfully updated.'
    else
      render :update do |page|
        page["error_messages"].replace_html :partial => "/shared/error_messages", :locals => { :object => @country }
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
