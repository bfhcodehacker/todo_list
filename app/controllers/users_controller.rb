class UsersController < ApplicationController
  def show
    @user = User.where(:id => params[:id]).first
    if @user.blank?
      render :text => "Not Found", :status => :not_found
    end
    @thing = Thing.new
  end
end
