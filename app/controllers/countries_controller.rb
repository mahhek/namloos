class CountriesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def edit
    @country = Country.find(params[:id])
  end

  def create
    @country = Country.new(params[:country])
    respond_to do |format|
      if @country.save
        format.js do
          foo = render_to_string(:partial => 'form').to_json
          render :js => "$('#form_div').html(#{foo})"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @country }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end

    #    if @country.save
    #      redirect_to :action => "index", :notice => 'Country was successfully created.'
    #    else
    #      render :update do |page|
    #        #        page["error_messages"].replace_html :text => "Fit a fit a fit a fit a fit."
    #        #        page << "$('#{error_messages}').html('Fit a fit a fit a fit a fit.');"
    ##        page << "alert('fit');"
    #        #        :partial => "/shared/error_messages", :locals => { :object => @country }
    #      end
    #    end
  end

  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(params[:country])
      redirect_to :action => "index", :notice => 'Country was successfully updated.'
    else
      render :update do |page|
        page["error_messages"].replace_html :text => "Fit a fit a fit a fit a fit."
        #        :partial => "/shared/error_messages", :locals => { :object => @country }
      end
    end
  end

  def destroy
    @country = Country.find(params[:id])
    if @country.seller_rates.count > 0
      flash[:error] = "Country cannot be deleted, It has some seller rates against it!"
    else
      @country.destroy
      flash[:notice] = "Country is deleted Successfully!"
    end
    redirect_to countries_url
  end
end
