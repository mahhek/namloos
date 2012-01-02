class ApplyTosController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
 
  def index
    @apply_tos = ApplyTo.all
  end

  def show
    @apply_to = ApplyTo.find(params[:id])
  end

  def new
    @apply_to = ApplyTo.new
    render :layout => false
  end

  def edit
    @apply_to = ApplyTo.find(params[:id])
  end

  def create
    @apply_to = ApplyTo.new(params[:apply_to])

    respond_to do |format|
      if @apply_to.save
        format.js do
          render :js => "window.location='/apply_tos'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @apply_to }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  
  def update
    @apply_to = ApplyTo.find(params[:id])

    respond_to do |format|
      if @apply_to.update_attributes(params[:apply_to])
        format.js do
          render :js => "window.location='/apply_tos'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @apply_to }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def destroy
    @apply_to = ApplyTo.find(params[:id])
    
    if @apply_to.seller_rates.count > 0
      flash[:error] = "Apply To  cannot be deleted, It has some seller rates against it!"
    else
      @apply_to.destroy
      flash[:notice] = "Apply To is deleted Successfully!"      
    end
    redirect_to apply_tos_url
      
  end
end

