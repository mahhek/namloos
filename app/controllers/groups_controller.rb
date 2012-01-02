class GroupsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    render :layout =>false
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.js do
          render :js => "window.location='/groups'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @group }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end


  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.js do
          render :js => "window.location='/groups'"
        end
      else
        format.js do
          foo = render_to_string(:partial => '/shared/error_messages', :locals => { :object => @group }).to_json
          render :js => "$('#error_messages').html(#{foo})"
        end
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_url
  end
end

