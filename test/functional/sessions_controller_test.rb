require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create a new session" do
    get :create
    assert_response :success
  end
  
  test "should destroy a session" do
    get :destroy
    assert_response :success
  end

end
