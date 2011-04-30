class LocationsController < ApplicationController
  #before_filter :login_required, :only=>['create', 'check_in', 'destroy']
  before_filter :user_valid?, :only => ['create', 'destroy']

	def create
	  @user = User.find(params[:user_id])
	  @location = @user.locations.create(params[:location])
    if @location.save
	    respond_to do |format|
	      format.html { redirect_to(@user, :notice => 'Location added.') }
	    end
    else
	    respond_to do |format|
        format.html { redirect_to(@user, :notice => 'Location not added.') }
      end
    end
	end

	def check_in
	  @user = User.find(session[:user_id])
		@location = Location.find(params[:location_id])
	  @location.update_attributes(:updated_at => Time.now)
    respond_to do |format|
      format.html { redirect_to(@user, :notice => 'Updated your location.') }
    end
  end

	def destroy
	  @location = Location.find(params[:id])
    @location.destroy
    respond_to do |format|
      format.html { redirect_to(@user, :notice => 'Location deleted.') }
    end
	end
end
