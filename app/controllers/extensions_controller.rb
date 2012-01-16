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

