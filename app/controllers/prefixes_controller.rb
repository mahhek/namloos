class PrefixesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @prefixes = Prefix.all
  end

  def show
    @prefix = Prefix.find(params[:id])
  end

  def new
    @prefix = Prefix.new
    render :layout => false
  end

  def edit
    @prefix = Prefix.find(params[:id])
  end

  def create
    @prefix = Prefix.new(params[:prefix])

    respond_to do |format|
      if @prefix.save
        format.js do
          render :js => "window.location='/prefixes'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @prefix }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def update
    @prefix = Prefix.find(params[:id])

    respond_to do |format|
      if @prefix.update_attributes(params[:prefix])
        format.js do
          render :js => "window.location='/prefixes'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @prefix }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def destroy
    @prefix = Prefix.find(params[:id])
    @prefix.destroy
    flash[:notice] = "Prefix deleted successfully!"
    redirect_to prefixes_url
      
  end
end

