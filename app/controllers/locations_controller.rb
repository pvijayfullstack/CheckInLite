class LocationsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@location = @user.locations.create(params[:location])
		redirect_to user_path(@user, :notice => 'Location added.')
#		if @location.save
#      format.html { redirect_to user_path(@user, :notice => 'Location added.') }
#    else
#      format.html { render :action => "new" }
#    end
	end
	def edit
		# Note, I have some bullshit routing problem going on here that forces me to use user_id instead of loc id.
		@location = Location.find(params[:user_id])
		@location.update_attributes(:updated_at => Time.now)
	    respond_to do |format|
			format.html { redirect_to user_path(@user) }
		end
	end
	def destroy
		@user = User.find(params[:user_id])
		@location = Location.find(params[:id])
		@location.destroy
		respond_to do |format|
			format.html { redirect_to user_path(@user) }
		end
	end
end
