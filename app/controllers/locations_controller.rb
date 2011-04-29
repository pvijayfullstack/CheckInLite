class LocationsController < ApplicationController
  before_filter :login_required, :only=>['create', 'destroy']
	def create
	  @user = User.find(params[:user_id])
	  @location = @user.locations.create(params[:location])
    if @location.save && user_valid
      redirect_to (@user, :notice => 'Location added')
      #redirect_to (@user), :notice => 'Location added'
    else
      redirect_to (@user, :notice => 'Location not added')
      #redirect_to (@user), :notice => 'Location not added, please include all fields.'
    end
	end
	def edit
		# Note, I have some bullshit routing problem going on here that forces me to use user_id instead of loc id.
		@location = Location.find(params[:user_id])
		if @location.user_id == session[:user_id]
		  @location.update_attributes(:updated_at => Time.now)
	      respond_to do |format|
			    format.html { redirect_to user_path(@user) }
		    end
	  else
	    redirect_to (user_path(@user), :notice => 'You do not have permission for this')
    end		  
	end
	
	def destroy
	  @user = User.find(params[:user_id])
	  @location = Location.find(params[:id])
	  if user_valid
	    @location.destroy
	    respond_to do |format|
		    format.html { redirect_to user_path(@user) }
	    end
	  else
	    redirect_to (@user, :notice => 'You do not have permission for this')
    end
	end
end
