class ApplyTosController < ApplicationController
  before_filter :authenticate_user!
  # GET /apply_tos
  # GET /apply_tos.json
  def index
    @apply_tos = ApplyTo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apply_tos }
    end
  end

  # GET /apply_tos/1
  # GET /apply_tos/1.json
  def show
    @apply_to = ApplyTo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apply_to }
    end
  end

  # GET /apply_tos/new
  # GET /apply_tos/new.json
  def new
    @apply_to = ApplyTo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apply_to }
    end
  end

  # GET /apply_tos/1/edit
  def edit
    @apply_to = ApplyTo.find(params[:id])
  end

  # POST /apply_tos
  # POST /apply_tos.json
  def create
    @apply_to = ApplyTo.new(params[:apply_to])

    respond_to do |format|
      if @apply_to.save
        format.html { redirect_to @apply_to, notice: 'Apply to was successfully created.' }
        format.json { render json: @apply_to, status: :created, location: @apply_to }
      else
        format.html { render action: "new" }
        format.json { render json: @apply_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apply_tos/1
  # PUT /apply_tos/1.json
  def update
    @apply_to = ApplyTo.find(params[:id])

    respond_to do |format|
      if @apply_to.update_attributes(params[:apply_to])
        format.html { redirect_to @apply_to, notice: 'Apply to was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @apply_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apply_tos/1
  # DELETE /apply_tos/1.json
  def destroy
    @apply_to = ApplyTo.find(params[:id])
    
    if @apply_to.seller_rates.count > 0
      flash[:error] = "Apply To  cannot be deleted, It has some seller rates against it!"
    else
      @apply_to.destroy
      flash[:notice] = "Apply To is deleted Successfully!"      
    end
    respond_to do |format|
      format.html { redirect_to apply_tos_url }
      format.json { head :ok }
    end
  end
end
