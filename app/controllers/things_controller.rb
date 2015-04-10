class ThingsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_thing, :only => [:update, :edit]

  def new
    @thing = Thing.new
  end

  def create
    @thing = current_user.things.create(thing_params)
    if @thing.valid?
      redirect_to user_path(current_user)
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def update
    respond_to do |format|
      format.html { 
        current_thing.update_attributes(thing_params)
        redirect_to user_path(current_user) 
        }
      format.json { 
        current_thing.update_attributes(thing_params) 
        render :nothing => true
        }
    end
  end

  def destroy
    current_thing.destroy
    redirect_to user_path(current_user)
  end

  private

  def require_authorized_for_current_thing
    if current_thing.user != current_user
      render :text => 'Unauthorized', :status => :unauthorized
    end
  end

  def current_thing
    @current_thing ||= Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:name, :due, :description, :row_order_position)
  end

end
