class CustomersController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @customers = Customer.all:order => 'created_at DESC'
    @customer = Customer.new
    @apply_tos = ApplyTo.all
    @extensions = Extension.all
  end


  def show
    @customer = Customer.find(params[:id])
  end


  def new
    @customer = Customer.new
    @extensions = Extension.all
  end


  def edit
    @customer = Customer.find(params[:id])
    @apply_tos = ApplyTo.all
    @extensions = Extension.all
  end

  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        params[:extensions].each do|e|
          extension = Extension.find_by_name(e)
          @customer.extensions << extension
        end
        flash[:notice] = "Contact created successfully!."
        format.js do
          render :js => "window.location='/customers'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @customer}).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
       params[:extensions].each do|e|
          extension = Extension.find_by_name(e)
          @customer.extensions << extension
        end
        flash[:notice] = "Contact updated successfully!."
        format.js do
          render :js => "window.location='/customers'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @customer}).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "Contact deleted successfully!"
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :ok }
    end
  end
end
