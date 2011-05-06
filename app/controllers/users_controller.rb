class UsersController < ApplicationController
  before_filter :login_required, :only=>['index']
  before_filter :user_valid?, :only => ['show', 'edit', 'update', 'destroy']
  
  def index
    @users = User.all
    #@users = @users.sort_by &:updated_at
    #@users.sort { |b,a| a.updated_at <=> b.updated_at }
    @user = User.find(session[:user_id])
    respond_to do |format|
      format.html
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create  
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user]) && user_valid
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
		session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
