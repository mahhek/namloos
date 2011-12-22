class CallgroupsController < ApplicationController
  before_filter :authenticate_user!

  # GET /callgroups
  # GET /callgroups.json
  def index
    @callgroups = Callgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @callgroups }
    end
  end

  # GET /callgroups/1
  # GET /callgroups/1.json
  def show
    @callgroup = Callgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @callgroup }
    end
  end

  # GET /callgroups/new
  # GET /callgroups/new.json
  def new
    @callgroup = Callgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @callgroup }
    end
  end

  # GET /callgroups/1/edit
  def edit
    @callgroup = Callgroup.find(params[:id])
  end

  # POST /callgroups
  # POST /callgroups.json
  def create
    @callgroup = Callgroup.new(params[:callgroup])

    respond_to do |format|
      if @callgroup.save
        format.html { redirect_to @callgroup, notice: 'Callgroup was successfully created.' }
        format.json { render json: @callgroup, status: :created, location: @callgroup }
      else
        format.html { render action: "new" }
        format.json { render json: @callgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /callgroups/1
  # PUT /callgroups/1.json
  def update
    @callgroup = Callgroup.find(params[:id])

    respond_to do |format|
      if @callgroup.update_attributes(params[:callgroup])
        format.html { redirect_to @callgroup, notice: 'Callgroup was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @callgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /callgroups/1
  # DELETE /callgroups/1.json
  def destroy
    @callgroup = Callgroup.find(params[:id])

    if @callgroup.seller_rates.count > 0
      flash[:error] = "Call group cannot be deleted, It has some seller rates against it!"
    else
      @callgroup.destroy
      flash[:notice] = "Call group deleted successfully!"
    end    

    respond_to do |format|
      format.html { redirect_to callgroups_url }
      format.json { head :ok }
    end
  end
end
