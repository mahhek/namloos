class ExtensionsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @extensions = Extension.all:order => 'created_at DESC'
    @extension = Extension.new
  end

  def show
    @extension = Extension.find(params[:id])
  end

  def get_extensions
    @customer = Customer.find_by_id(params[:customer_id])
    @extensions = @customer.extensions

    respond_to do |format|
      format.js do
        foo = render_to_string(:partial => '/extensions/extensions', :locals => { :extensions => @extensions }).to_json
        render :js => "$('#users_extensions').html(#{foo})"
      end
    end
  end 

  def new
    @extension = Extension.new
    render :layout =>false
  end

  def edit
    @extension = Extension.find(params[:id])
  end

  def create
    @extension = Extension.new(params[:extension])

    respond_to do |format|
      if @extension.save
        format.js do
          render :js => "window.location='/extensions'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @extension }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def update
    @extension = Extension.find(params[:id])

    respond_to do |format|
      if @extension.update_attributes(params[:extension])
        format.js do
          render :js => "window.location='/extensions'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @extension }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def destroy
    @extension = Extension.find(params[:id])
    @extension.destroy
    flash[:notice] = "Extension deleted successfully!"
    redirect_to extensions_url
  end
end

