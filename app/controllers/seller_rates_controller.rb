class SellerRatesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @seller_rates = SellerRate.all
  end

  def show
    @seller_rate = SellerRate.find(params[:id])
  end

  def new
    load data
    @seller_rate = SellerRate.new
    render :layout =>false
  end


  def edit
    load_data
    @seller_rate = SellerRate.find(params[:id])
  end

  def create
    @seller_rate = SellerRate.new(params[:seller_rate])
    respond_to do |format|
      if @seller_rate.save
        format.js do
          render :js => "window.location='/seller_rates'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @seller_rate }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

       
  def update
    @seller_rate = SellerRate.find(params[:id])

    respond_to do |format|
      if @seller_rate.update_attributes(params[:seller_rate])
        format.js do
          render :js => "window.location='/seller_rates'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @seller_rate }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def destroy
    @seller_rate = SellerRate.find(params[:id])

    @seller_rate.destroy
    flash[:notice] = "Seller Rates deleted successfully!"

    redirect_to seller_rates_url
  end
end

private
def load_data
  @countries = Country.all
  @apply_tos = ApplyTo.all
  @regions   = Region.all
  @prefixes  = Prefix.all
  @call_groups = Callgroup.all
  @call_definations = CallDefination.all
end       

