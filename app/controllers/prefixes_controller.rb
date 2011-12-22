class PrefixesController < ApplicationController
  before_filter :authenticate_user!

  # GET /prefixes
  # GET /prefixes.json
  def index
    @prefixes = Prefix.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prefixes }
    end
  end

  # GET /prefixes/1
  # GET /prefixes/1.json
  def show
    @prefix = Prefix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prefix }
    end
  end

  # GET /prefixes/new
  # GET /prefixes/new.json
  def new
    @prefix = Prefix.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prefix }
    end
  end

  # GET /prefixes/1/edit
  def edit
    @prefix = Prefix.find(params[:id])
  end

  # POST /prefixes
  # POST /prefixes.json
  def create
    @prefix = Prefix.new(params[:prefix])

    respond_to do |format|
      if @prefix.save
        format.html { redirect_to @prefix, notice: 'Prefix was successfully created.' }
        format.json { render json: @prefix, status: :created, location: @prefix }
      else
        format.html { render action: "new" }
        format.json { render json: @prefix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prefixes/1
  # PUT /prefixes/1.json
  def update
    @prefix = Prefix.find(params[:id])

    respond_to do |format|
      if @prefix.update_attributes(params[:prefix])
        format.html { redirect_to @prefix, notice: 'Prefix was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @prefix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefixes/1
  # DELETE /prefixes/1.json
  def destroy
    @prefix = Prefix.find(params[:id])
    if @prefix.seller_rates.count > 0
      flash[:error] = "Prefix cannot be deleted, It has some seller rates against it!"
    else
      @prefix.destroy
      flash[:notice] = "Prefix deleted successfully!"
    end
 
    respond_to do |format|
      format.html { redirect_to prefixes_url }
      format.json { head :ok }
    end
  end
end
