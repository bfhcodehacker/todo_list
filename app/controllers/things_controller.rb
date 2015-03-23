class ThingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @thing = Thing.new
  end

  def create
    @thing = current_user.things.create(thing_params)
    if @thing.valid?
      redirect_to user_path(current_user)
    else
      render :new, :status => :unprocessable_entit
    end
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def update
    current_thing.update_attributes(thing_params)
    redirect_to user_path(current_user)
  end

  def destroy
    current_thing.destroy
    redirect_to user_path(current_user)
  end

  private

  def current_thing
    @current_thing ||= Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:name, :due, :description)
  end

end
