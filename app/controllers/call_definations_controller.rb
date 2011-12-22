class CallDefinationsController < ApplicationController
  before_filter :authenticate_user!

  # GET /call_definations
  # GET /call_definations.json
  def index
    @call_definations = CallDefination.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @call_definations }
    end
  end

  # GET /call_definations/1
  # GET /call_definations/1.json
  def show
    @call_defination = CallDefination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call_defination }
    end
  end

  # GET /call_definations/new
  # GET /call_definations/new.json
  def new
    @call_defination = CallDefination.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call_defination }
    end
  end

  # GET /call_definations/1/edit
  def edit
    @call_defination = CallDefination.find(params[:id])
  end

  # POST /call_definations
  # POST /call_definations.json
  def create
    @call_defination = CallDefination.new(params[:call_defination])

    respond_to do |format|
      if @call_defination.save
        format.html { redirect_to @call_defination, notice: 'Call defination was successfully created.' }
        format.json { render json: @call_defination, status: :created, location: @call_defination }
      else
        format.html { render action: "new" }
        format.json { render json: @call_defination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /call_definations/1
  # PUT /call_definations/1.json
  def update
    @call_defination = CallDefination.find(params[:id])

    respond_to do |format|
      if @call_defination.update_attributes(params[:call_defination])
        format.html { redirect_to @call_defination, notice: 'Call defination was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @call_defination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_definations/1
  # DELETE /call_definations/1.json
  def destroy
    @call_defination = CallDefination.find(params[:id])
    if @call_defination.seller_rates.count > 0
      flash[:notice] = "Call definition cannot be deleted, It has some seller rates against it!"
    else
      @call_defination.destroy
      flash[:notice] = "Call definition deleted successfully!"
    end 

    respond_to do |format|
      format.html { redirect_to call_definations_url }
      format.json { head :ok }
    end
  end
end
