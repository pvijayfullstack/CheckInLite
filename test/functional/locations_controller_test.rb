require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @user = User.last
    @location = @user.locations.last
  end

  test "should create a new location" do
    post(:create_location, nil, {'user_id' => @user.id}, {'location' => @location})
    assert_response :success
  end

  test "should check in a user at a location" do
    get(:check_in, {'location_id' => @location.id}, {'user_id' => @user.id})
    assert_response :success
  end
  
  test "should destroy a location record" do
    delete('destroy', {'id' => @location.id}, {'user_id' => @user.id})
    assert_response :success
  end
  
end
