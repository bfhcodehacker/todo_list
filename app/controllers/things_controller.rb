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

  private

  def thing_params
    params.require(:thing).permit(:name, :due, :description)
  end

end
