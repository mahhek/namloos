class SellerRatesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @seller_rates = SellerRate.all :order => 'created_at DESC'
  end

  def show
    @seller_rate = SellerRate.find(params[:id])
  end

  def new
    @seller_rate = SellerRate.new
    load_data
  end

  def edit
    load_data
    @seller_rate = SellerRate.find(params[:id])
    @countries = @seller_rate.region.countries
  end

  def create
    @seller_rate = SellerRate.new(params[:seller_rate])

    respond_to do |format|
      if @seller_rate.save
        flash[:notice] = "Seller rate created successfully!."
        format.js do
          render :js => "window.location='/seller_rates'"
        end
      else
        load_data
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @seller_rate}).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def update
    @seller_rate = SellerRate.find(params[:id])

    respond_to do |format|
      if @seller_rate.update_attributes(params[:seller_rate])
        flash[:notice] = "Counry updated successfully!"
        format.js do
          render :js => "window.location='/seller_rates'"
        end
      else
        load_data
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

    respond_to do |format|
      format.html { redirect_to seller_rates_url }
      format.json { head :ok }
    end
  end


  private
  def load_data
    @countries = []
    @apply_tos = ApplyTo.all
    @regions   = Region.all
    @call_groups = Callgroup.all
    @call_definations = CallDefination.all
  end
end
