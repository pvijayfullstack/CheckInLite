require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @user = User.last
    @eviluser = User.first
    @location = @user.locations.last
  end

  test "should create a new location" do
    location = {:user_id => @user.id, :name => "Shea's House", :address => "2808 Kelly Square, Vienna VA 22181", :contact_info => "Cell Phone 555-555-1212"}
    post(:create, {'user_id' => @user.id, 'location' => location}, {'user_id' => @user.id})
    assert @location.save
    assert_response(:redirect, message = nil)
    assert_equal 'Location added.', flash[:notice]
  end
  
  test "should not create a new location if wrong user_id" do
    location = {:user_id => @user.id, :name => "Shea's House", :address => "2808 Kelly Square, Vienna VA 22181", :contact_info => "Cell Phone 555-555-1212"}
    post(:create, {'user_id' => @user.id, 'location' => location}, {'user_id' => @eviluser.id})
    assert @location.save
    assert_response(:redirect, message = nil)
    assert_equal 'You do not have permission for that page.', flash[:notice]
  end

  test "should check in a user at a location" do
    get(:check_in, {'location_id' => @location.id}, {'user_id' => @user.id})
    assert @location.update_attributes(:updated_at => Time.now)
    assert_response(:redirect, message = nil)
    assert_equal 'Updated your location.', flash[:notice]
  end

  test "should not check in a user at a location if user_id is incorrect." do
    get(:check_in, {'location_id' => @location.id}, {'user_id' => @eviluser.id})
    assert @location.update_attributes(:updated_at => Time.now)
    assert_response(:redirect, message = nil)
    assert_equal 'You do not have permission for that page.', flash[:notice]
  end
  
  test "should destroy a location record" do
    delete(:destroy, {'id' => @location.id, 'user_id' => @user.id}, {'user_id' => @user.id})
    assert @location.destroy
    assert_response(:redirect, message = nil)
    assert_equal 'Location deleted.', flash[:notice]
  end

  test "should not destroy a location record if user_id incorrect" do
    delete(:destroy, {'id' => @location.id, 'user_id' => @user.id}, {'user_id' => @eviluser.id})
    assert @location.destroy
    assert_response(:redirect, message = nil)
    assert_equal 'You do not have permission for that page.', flash[:notice]
  end  
end
