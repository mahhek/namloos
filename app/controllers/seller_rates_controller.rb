class SellerRatesController < ApplicationController
  before_filter :authenticate_user!
  # GET /seller_rates
  # GET /seller_rates.json
  def index
    @seller_rates = SellerRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seller_rates }
    end
  end

  # GET /seller_rates/1
  # GET /seller_rates/1.json
  def show
    @seller_rate = SellerRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seller_rate }
    end
  end

  # GET /seller_rates/new
  # GET /seller_rates/new.json
  def new
    @seller_rate = SellerRate.new
    @countries = Country.all
    @apply_tos = ApplyTo.all
    @regions   = Region.all
    @prefixes  = Prefix.all
    @call_groups = Callgroup.all
    @call_definations = CallDefination.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seller_rate }
    end
  end

  # GET /seller_rates/1/edit
  def edit
    @countries = Country.all
    @apply_tos = ApplyTo.all
    @regions   = Region.all
    @prefixes  = Prefix.all
    @call_groups = Callgroup.all
    @call_definations = CallDefination.all
    @seller_rate = SellerRate.find(params[:id])
  end

  # POST /seller_rates
  # POST /seller_rates.json
  def create
    @seller_rate = SellerRate.new(params[:seller_rate])

    respond_to do |format|
      if @seller_rate.save
        format.html { redirect_to @seller_rate, notice: 'Seller rate was successfully created.' }
        format.json { render json: @seller_rate, status: :created, location: @seller_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @seller_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seller_rates/1
  # PUT /seller_rates/1.json
  def update
    @seller_rate = SellerRate.find(params[:id])

    respond_to do |format|
      if @seller_rate.update_attributes(params[:seller_rate])
        format.html { redirect_to @seller_rate, notice: 'Seller rate was successfully updated.' }
        format.json { head :ok }
      else
        @countries = Country.all
        @apply_tos = ApplyTo.all
        @regions   = Region.all
        @prefixes  = Prefix.all
        @call_groups = Callgroup.all
        @call_definations = CallDefination.all
        format.html { render action: "edit" }
        format.json { render json: @seller_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seller_rates/1
  # DELETE /seller_rates/1.json
  def destroy
    @seller_rate = SellerRate.find(params[:id])
    @seller_rate.destroy

    respond_to do |format|
      format.html { redirect_to seller_rates_url }
      format.json { head :ok }
    end
  end
end
